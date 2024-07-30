import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/balloon_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/cuisine.dart';
import '../../../service/lg_service.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'bloc/cuisines_bloc.dart';
import 'bloc/cuisines_event.dart';
import 'panels/cuisine_details_card.dart';
import 'panels/cuisine_input_card.dart';

typedef T = List<Cuisine>;

class CuisinePage extends StatefulWidget {
  const CuisinePage({super.key});

  @override
  State<CuisinePage> createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int _selected = 0;
  List<Cuisine> _cuisines = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _cuisines.isNotEmpty
          ? CameraPosition(
              target: LatLng(
                _cuisines[_selected].latitude,
                _cuisines[_selected].longitude,
              ),
              zoom: 7,
            )
          : null,
      controller: _controller,
      panelLeft: CuisineInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<CuisinesBloc>(context).add(GetCuisines(params));
        },
      ),
      panelDividedLeft: blocBuilder<CuisinesBloc, T>(
        onLoading: () {
          _selected = 0;
        },
        onSuccess: (result) {
          _cuisines = result;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _cuisines.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ResponseItemCard(
                    title: _cuisines[index].name,
                    description: _cuisines[index].description,
                    label: _cuisines[index].duration,
                    selected: _selected == index,
                    onTap: () async {
                      setState(() {
                        _selected = index;
                      });
                      await LGService().sendKml(KmlUtils.createCircle(LatLng(
                        _cuisines[_selected].latitude,
                        _cuisines[_selected].longitude,
                      )));
                      moveToPlace(
                        _controller,
                        LatLng(
                          _cuisines[_selected].latitude,
                          _cuisines[_selected].longitude,
                        ),
                      );
                    },
                  ),
                  if (index < _cuisines.length - 1) const SizedBox(height: 8)
                ],
              );
            },
          );
        },
      ),
      panelRight: blocBuilder<CuisinesBloc, T>(onSuccess: (result) {
        LGService().showBalloon(BalloonUtils().createBalloonForCuisine(result[_selected]));
        return CuisineDetailsCard(
          cuisine: _cuisines[_selected],
        );
      }),
    );
  }
}
