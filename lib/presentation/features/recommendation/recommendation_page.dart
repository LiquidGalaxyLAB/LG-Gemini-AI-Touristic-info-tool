import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/presentation/features/recommendation/panels/recommendation_input_card.dart';

import '../../components/layout_blueprint.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  static const double spacing = 12.0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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
      panelLeft: RecommendationInputCard(
        onContinueClick: () {},
      ),
      panelRight: Placeholder(),
      panelDividedLeft: Placeholder(),
    );
  }
}
