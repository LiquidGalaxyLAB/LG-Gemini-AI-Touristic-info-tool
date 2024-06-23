import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/app_theme.dart';
import 'maps_card.dart';

class LayoutBlueprint extends StatelessWidget {
  static const double spacing = 12.0;
  final CameraPosition _cameraPosition;
  final Completer<GoogleMapController> _controller;
  final Widget _panelLeft;
  final Widget? _panelDividedLeft;
  final Widget _panelRight;

  const LayoutBlueprint({
    super.key,
    required CameraPosition cameraPosition,
    required Completer<GoogleMapController> controller,
    required Widget panelLeft,
    required Widget panelRight,
    Widget? panelDividedLeft,
  })  : _panelDividedLeft = panelDividedLeft,
        _panelLeft = panelLeft,
        _controller = controller,
        _cameraPosition = cameraPosition,
        _panelRight = panelRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray.shade900,
      padding: const EdgeInsets.all(spacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Flexible(
                  flex: _panelDividedLeft == null ? 10 : 5,
                  child: Container(
                    padding: const EdgeInsets.all(spacing),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.gray.shade800,
                    ),
                    child: _panelLeft,
                  ),
                ),
                if (_panelDividedLeft != null)
                const SizedBox(height: spacing),
                if (_panelDividedLeft != null)
                Flexible(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(spacing),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.gray.shade800,
                    ),
                    child: _panelRight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: spacing),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: MapsCard(
                    cameraPosition: _cameraPosition,
                    controller: _controller,
                  ),
                ),
                const SizedBox(height: spacing),
                Flexible(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(spacing),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.gray.shade800,
                    ),
                    child: _panelDividedLeft,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
