import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/presentation/features/cuisine/panels/cuisine_input_card.dart';

import '../../components/layout_blueprint.dart';

class CuisinePage extends StatefulWidget {
  const CuisinePage({super.key});

  @override
  State<CuisinePage> createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
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
      panelLeft: CuisineInputCard(
        onContinueClick: () {},
      ),
      panelRight: Placeholder(),
      panelDividedLeft: Placeholder(),
    );
  }
}
