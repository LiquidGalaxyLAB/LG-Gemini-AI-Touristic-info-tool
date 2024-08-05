import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/service/location_service.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/tourist_place.dart';
import '../../../service/lg_service.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import '../favourites/bloc/favourites_bloc.dart';
import '../favourites/bloc/favourites_event.dart';
import 'bloc/tourist_places_bloc.dart';
import 'bloc/tourist_places_event.dart';
import 'panels/tourist_place_details_card.dart';
import 'panels/tourist_place_input_card.dart';

typedef T = List<TouristPlace>;

class TouristPlacePage extends StatefulWidget {
  const TouristPlacePage({super.key});

  @override
  State<TouristPlacePage> createState() => _TouristPlacePageState();
}

class _TouristPlacePageState extends State<TouristPlacePage> {
  var _selected = 0;
  List<TouristPlace> _touristPlaces = [];
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  final List<int> _liked = [];

  Future<void> _onOrbitButtonClick() async {
    await LGService().sendTour(
      "Orbit",
      KmlUtils.orbitAround(
        await _getLatLng(),
      ),
    );
    await LGService().startOrbit();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _touristPlaces.isNotEmpty
          ? CameraPosition(
              target: LatLng(
                _touristPlaces[_selected].latitude,
                _touristPlaces[_selected].longitude,
              ),
              zoom: 7,
            )
          : null,
      controller: _controller,
      onMapOrbitButtonTap: _onOrbitButtonClick,
      panelLeft: TouristPlaceInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<TouristPlacesBloc>(context).add(GetTouristPlaces(params));
        },
      ),
      panelDividedLeft: blocBuilder<TouristPlacesBloc, T>(
        onLoading: () {
          _liked.clear();
          _selected = 0;
        },
        onSuccess: (result) {
          _touristPlaces = result;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _touristPlaces.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ResponseItemCard(
                    title: _touristPlaces[index].name,
                    description: _touristPlaces[index].specialty,
                    label: "(${_touristPlaces[index].latitude}, ${_touristPlaces[index].longitude})",
                    selected: _selected == index,
                    onTap: () async {
                      setState(() {
                        _selected = index;
                      });
                      await _syncLocation();
                    },
                  ),
                  if (index < _touristPlaces.length - 1) const SizedBox(height: 8)
                ],
              );
            },
          );
        },
      ),
      panelRight: blocBuilder<TouristPlacesBloc, T>(
        onSuccess: (result) {
          _syncLocation();
          return TouristPlaceDetailsCard(
            touristPlace: result[_selected],
            liked: _liked.contains(_selected),
            onIconClick: (place, isLiked) {
              if (isLiked) {
                setState(() {
                  _liked.add(_selected);
                });
                BlocProvider.of<FavouritesBloc>(context).add(
                  AddFavourite(place),
                );
              } else {
                setState(() {
                  _liked.remove(_selected);
                });
                BlocProvider.of<FavouritesBloc>(context).add(
                  RemoveFavourite(place),
                );
              }
            },
          );
        },
      ),
    );
  }

  Future<LatLng> _getLatLng() async {
    LatLng? latLng = await LocationService().getLatLngFromLocation(_touristPlaces[_selected].name);
    latLng ??= LatLng(_touristPlaces[_selected].latitude, _touristPlaces[_selected].longitude);
    return latLng;
  }

  Future<void> _syncLocation() async {
    final latLng = await _getLatLng();
    await LGService().sendKml(KmlUtils.createCircle(latLng));
    await LGService().showBalloon(_touristPlaces[_selected].generateBalloon());
    await moveToPlace(_controller, latLng, tilt: tilt);
  }
}
