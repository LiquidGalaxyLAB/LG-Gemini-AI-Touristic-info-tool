import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/presentation/features/itinerary/panels/itinerary_input_card.dart';

import '../../../config/theme/app_theme.dart';
import '../../components/layout_blueprint.dart';
import '../../components/maps_card.dart';
import '../tourist_place/panels/tourist_place_input_card.dart';

class ItineraryPage extends StatefulWidget {

  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  static const double spacing = 12.0;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: CameraPosition(
        target: LatLng(
          12.0,
          412.2,
        ),
        zoom: 7,
      ),
      controller: _controller,
      panelLeft: ItineraryInputCard(
        onContinueClick: () {},
      ),
      panelRight: Placeholder(),
      panelDividedLeft: Placeholder(),
    );
  }
}
