import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/itinerary.dart';
import '../../components/layout_blueprint.dart';
import 'panels/itinerary_input_card.dart';
import 'panels/main_response_card.dart';
import 'panels/place_description_card.dart';
import 'panels/route_details_card.dart';

Place eiffelTower = const Place(
  name: "Eiffel Tower",
  location: "Paris, France",
  latitude: 48.8584,
  longitude: 2.2945,
  description: "A wrought-iron lattice tower on the Champ de Mars in Paris.",
  highlights: [
    "Breathtaking views of Paris",
    "Iconic architectural design",
    "Dining at 58 Tour Eiffel",
    "Illuminations at night"
  ],
);

Place greatWall = const Place(
  name: "Great Wall of China",
  location: "China",
  latitude: 40.4319,
  longitude: 116.5704,
  description:
      "A series of fortifications built across the historical northern borders of China.",
  highlights: [
    "Historical significance",
    "Panoramic views",
    "Cultural exhibitions",
    "Hiking opportunities"
  ],
);

Place grandCanyon = const Place(
  name: "Grand Canyon",
  location: "Arizona, United States",
  latitude: 36.1069,
  longitude: -112.1129,
  description: "A steep-sided canyon carved by the Colorado River.",
  highlights: [
    "Spectacular geological formations",
    "Rafting on the Colorado River",
    "Hiking trails",
    "Helicopter tours"
  ],
);

TravelRoute parisToBeijing = const TravelRoute(
  mode: "Flight",
  from: "Paris",
  to: "Beijing",
  description: "A non-stop flight from Paris to Beijing.",
  duration: "10 hours",
  highlights: ["In-flight entertainment", "Meals provided"],
);

TravelRoute beijingToArizona = const TravelRoute(
  mode: "Flight",
  from: "Beijing",
  to: "Arizona",
  description: "A connecting flight from Beijing to Arizona.",
  duration: "15 hours",
  highlights: ["Layover in Los Angeles", "In-flight meals"],
);

// Example itinerary
Itinerary europeanAdventure = Itinerary(
  name: "World Wonders Tour",
  startingPoint: "Paris, France",
  travelRoute: [parisToBeijing, beijingToArizona],
  places: [eiffelTower, greatWall, grandCanyon],
);

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool _showRouteDetails = true;
  int _selectedPlace = 0;
  int _selectedRoute = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(
        target: LatLng(12.0, 412.2),
        zoom: 7,
      ),
      controller: _controller,
      panelLeft: ItineraryInputCard(
        onContinueClick: () {},
      ),
      panelDividedLeft: MainResponseCard(
        controller: _controller,
        itinerary: europeanAdventure,
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
      ),
      panelRight: _showRouteDetails
          ? RouteDetailsCard(
              route: europeanAdventure.travelRoute[_selectedRoute])
          : PlaceDescriptionCard(
              place: europeanAdventure.places[_selectedPlace]),
    );
  }
}
