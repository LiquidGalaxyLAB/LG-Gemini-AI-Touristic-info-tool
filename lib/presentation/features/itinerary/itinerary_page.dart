import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/itinerary.dart';
import '../../../service/lg_service.dart';
import '../../../service/location_service.dart';
import '../../components/layout_blueprint.dart';
import 'bloc/itinerary_bloc.dart';
import 'bloc/itinerary_event.dart';
import 'panels/itinerary_input_card.dart';
import 'panels/main_response_card.dart';
import 'panels/place_description_card.dart';
import 'panels/route_details_card.dart';

typedef T = Itinerary;

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  bool _showRouteDetails = false;
  int _selectedPlace = 0;
  int _selectedRoute = 0;
  Itinerary? _itinerary;

  LatLng? latLng;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _itinerary != null
          ? CameraPosition(
              target: LatLng(
                _itinerary!.places[_selectedPlace].latitude,
                _itinerary!.places[_selectedPlace].longitude,
              ),
              zoom: 7,
            )
          : null,
      controller: _controller,
      shouldShowMapTourButton: !_showRouteDetails,
      onMapTourButtonTap: () async {
        if (_itinerary != null) {
          List<LatLng> latLngList = await Future.wait(
            _itinerary!.places.asMap().entries.map((e) => _getLatLng(idx: e.key)).toList(),
          );

          await LGService().sendTour(
            "Tour",
            KmlUtils.createTour(latLngList),
          );
          await LGService().startTour();
        }
      },
      onMapOrbitButtonTap: () async {
        if (!_showRouteDetails) {
          await LGService().sendTour(
            "Orbit",
            KmlUtils.orbitAround(await _getLatLng()),
          );
          await LGService().startOrbit();
        } else if (latLng != null) {
          await LGService().sendTour(
            "Orbit",
            KmlUtils.orbitAround(latLng!),
          );
          await LGService().startOrbit();
        }
      },
      panelLeft: ItineraryInputCard(
        onContinueClick: (params) async {
          showErrorDialog = true;
          BlocProvider.of<ItineraryBloc>(context).add(GetItinerary(params));
        },
      ),
      panelDividedLeft: blocBuilder<ItineraryBloc, T>(
        onLoading: () {
          _showRouteDetails = false;
          _selectedPlace = 0;
          _selectedRoute = 0;
        },
        onSuccess: (result) {
          _itinerary = result;
          LGService().showBalloon(result.generateBalloon());
          LGService().sendKml(
            KmlUtils.createPolyline(
              result.places.map((p) => LatLng(p.latitude, p.longitude)).toList(),
            ),
          );
          return MainResponseCard(
            itinerary: _itinerary!,
            selectedPlace: _selectedPlace,
            selectedRoute: _selectedRoute,
            showRouteTable: _showRouteDetails,
            onTap: (value) {
              setState(() {
                _showRouteDetails = value;
              });
            },
            onPlaceTap: (value) async {
              setState(() {
                _selectedPlace = value;
              });
              await moveToPlace(
                _controller,
                LatLng(
                  _itinerary!.places[_selectedPlace].latitude,
                  _itinerary!.places[_selectedPlace].longitude,
                ),
                tilt: tilt,
              );
            },
            onRouteTap: (value) async {
              setState(() {
                _selectedRoute = value;
              });
              latLng = await LocationService().getLatLngFromLocation(_itinerary!.places[_selectedRoute].name);
              if (latLng != null) {
                await moveToPlace(_controller, latLng!, tilt: tilt);
              }
            },
          );
        },
      ),
      panelRight: blocBuilder<ItineraryBloc, T>(onSuccess: (result) {
        _syncLocation();
        if (_showRouteDetails) {
          return RouteDetailsCard(route: _itinerary!.travelRoute[_selectedRoute]);
        } else {
          return PlaceDescriptionCard(place: _itinerary!.places[_selectedPlace]);
        }
      }),
    );
  }

  Future<LatLng> _getLatLng({int idx = 0}) async {
    LatLng? latLng = await LocationService().getLatLngFromLocation(_itinerary!.places[idx].name);
    latLng ??= LatLng(_itinerary!.places[idx].latitude, _itinerary!.places[idx].longitude);
    return latLng;
  }

  Future<void> _syncLocation() async {
    moveToPlace(_controller, await _getLatLng(idx: _selectedPlace));
  }
}
