import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/balloon_utils.dart';
import '../../../domain/model/itinerary.dart';
import '../../../service/lg_service.dart';
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

  bool _showRouteDetails = true;
  int _selectedPlace = 0;
  int _selectedRoute = 0;
  Itinerary? _itinerary;

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
      panelLeft: ItineraryInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<ItineraryBloc>(context).add(GetItinerary(params));
        },
      ),
      panelDividedLeft: blocBuilder<ItineraryBloc, T>(onSuccess: (result) {
        _itinerary = result;
        log(BalloonUtils().createBalloonForItinerary(result));
        LGService().sendKml(BalloonUtils().createBalloonForItinerary(result));
        return MainResponseCard(
          controller: _controller,
          itinerary: _itinerary!,
          selectedPlace: _selectedPlace,
          selectedRoute: _selectedRoute,
          showRouteTable: _showRouteDetails,
          onTap: (value) {
            setState(() {
              _showRouteDetails = value;
            });
          },
          onPlaceTap: (value) {
            setState(() {
              _selectedPlace = value;
            });
          },
          onRouteTap: (value) {
            setState(() {
              _selectedRoute = value;
            });
          },
        );
      }),
      panelRight: blocBuilder<ItineraryBloc, T>(onSuccess: (result) {
        if (_showRouteDetails) {
          return RouteDetailsCard(route: _itinerary!.travelRoute[_selectedRoute]);
        } else {
          return PlaceDescriptionCard(place: _itinerary!.places[_selectedPlace]);
        }
      }),
    );
  }
}
