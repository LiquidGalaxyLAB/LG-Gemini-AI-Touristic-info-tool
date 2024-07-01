import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/app_theme.dart';
import 'maps_card.dart';

class LayoutBlueprint extends StatelessWidget {
  static const double spacing = 12.0;
  final Completer<GoogleMapController> _controller;
  final Widget _panelLeft;
  final Widget? _panelDividedLeft;
  final Widget _panelRight;
  final CameraPosition? _cameraPosition;

  const LayoutBlueprint({
    super.key,
    required Completer<GoogleMapController> controller,
    required Widget panelLeft,
    required Widget panelRight,
    required CameraPosition? cameraPosition,
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
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: _panelDividedLeft == null ? 10 : 6,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(spacing),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.gray.shade800,
                    ),
                    child: _panelLeft,
                  ),
                ),
                if (_panelDividedLeft != null) const SizedBox(height: spacing),
                if (_panelDividedLeft != null)
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
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
          ),
          const SizedBox(width: spacing),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: MapsCard(
                    cameraPosition: _cameraPosition ??
                        const CameraPosition(
                          target: LatLng(29.0588, 76.0856),
                          zoom: 7,
                        ),
                    controller: _controller,
                  ),
                ),
                const SizedBox(height: spacing),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
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
          )
        ],
      ),
    );
  }
}
