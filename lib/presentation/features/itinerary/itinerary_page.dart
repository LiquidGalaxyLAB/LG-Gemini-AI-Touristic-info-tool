import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/theme/app_theme.dart';
import '../../components/maps_card.dart';

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
    return Container(
      color: AppTheme.gray.shade900,
      padding: const EdgeInsets.all(spacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppTheme.gray.shade800,
              ),
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
                    cameraPosition: CameraPosition(
                      target: LatLng(
                        12.0,
                        412.2,
                      ),
                      zoom: 7,
                    ),
                    controller: _controller,
                  ),
                ),
                const SizedBox(height: spacing),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.gray.shade800,
                    ),
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
