import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/presentation/components/layout_blueprint.dart';

import '../../../config/theme/app_theme.dart';
import '../../components/maps_card.dart';

class TouristPlacePage extends StatefulWidget {

  const TouristPlacePage({super.key});

  @override
  State<TouristPlacePage> createState() => _TouristPlacePageState();
}

class _TouristPlacePageState extends State<TouristPlacePage> {
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
      panelLeft: Placeholder(),
      panelRight: Placeholder(),
      panelDividedLeft: Placeholder(),
    );
  }
}
