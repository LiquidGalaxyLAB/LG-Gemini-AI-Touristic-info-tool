import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/presentation/features/budget/panels/budget_input_card.dart';

import '../../../config/theme/app_theme.dart';
import '../../components/layout_blueprint.dart';
import '../../components/maps_card.dart';

class BudgetPage extends StatefulWidget {

  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
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
      panelLeft: BudgetInputCard(onContinueClick: (){},),
      panelRight: Placeholder(),
      panelDividedLeft: Placeholder(),
    );
  }
}
