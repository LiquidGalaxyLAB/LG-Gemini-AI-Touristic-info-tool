import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";

import '../../../core/constants/constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/recommendation.dart';
import '../../../service/lg_service.dart';
import '../../../service/location_service.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'bloc/recommendations_bloc.dart';
import 'bloc/recommendations_event.dart';
import 'panels/recommendation_details_card.dart';
import 'panels/recommendation_input_card.dart';

typedef T = List<Recommendation>;

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  List<Recommendation> _recommendations = [];
  int _selected = 0;

  Future<void> _onOrbitButtonClick() async {
    await LGService().sendTour(
      "Orbit",
      KmlUtils.orbitAround(
        await _getLatLng()
      ),
    );
    await LGService().startOrbit();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _recommendations.isNotEmpty
          ? CameraPosition(
              target: LatLng(
                _recommendations[_selected].latitude,
                _recommendations[_selected].longitude,
              ),
              zoom: 7,
            )
          : null,
      controller: _controller,
      onMapOrbitButtonTap: _onOrbitButtonClick,
      panelLeft: RecommendationInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<RecommendationsBloc>(context).add(GetRecommendations(params));
        },
      ),
      panelDividedLeft: blocBuilder<RecommendationsBloc, T>(
        onLoading: () {
          _selected = 0;
        },
        onSuccess: (result) {
          _recommendations = result;

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _recommendations.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ResponseItemCard(
                    title: _recommendations[index].name,
                    description: _recommendations[index].description,
                    label: _recommendations[index].duration,
                    selected: _selected == index,
                    onTap: () async {
                      setState(() {
                        _selected = index;
                      });
                      await _syncLocation();
                    },
                  ),
                  if (index < _recommendations.length - 1) const SizedBox(height: 8)
                ],
              );
            },
          );
        },
      ),
      panelRight: blocBuilder<RecommendationsBloc, T>(onSuccess: (result) {
        _syncLocation();
        return RecommendationDetailsCard(
          recommendation: _recommendations[_selected],
        );
      }),
    );
  }

  Future<LatLng> _getLatLng() async {
    LatLng? latLng = await LocationService().getLatLngFromLocation(_recommendations[_selected].location);
    latLng ??= LatLng(_recommendations[_selected].latitude, _recommendations[_selected].longitude);
    return latLng;
  }

  Future<void> _syncLocation() async {
    LatLng latLng = await _getLatLng();
    await LGService().sendKml(KmlUtils.createCircle(latLng));
    await LGService().showBalloon(_recommendations[_selected].generateBalloon());
    await moveToPlace(_controller, latLng, tilt: tilt);
  }
}
