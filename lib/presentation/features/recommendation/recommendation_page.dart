import 'dart:async';

import 'package:flutter/material.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";

import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/recommendation.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'panels/recommendation_details_card.dart';
import 'panels/recommendation_input_card.dart';

const List<Recommendation> recommendations = [
  Recommendation(
    name: "Eiffel Tower",
    description:
        "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France.",
    cost: "₹25.0",
    duration: "2.0 hrs.",
    highlights: [
      "Breathtaking views of Paris",
      "Iconic architectural design",
      "Dining at 58 Tour Eiffel",
      "Illuminations at night",
    ],
  ),
  Recommendation(
    name: "Great Wall of China",
    description:
        "The Great Wall of China is a series of fortifications that were built across the historical northern borders of China.",
    cost: "₹40.0",
    duration: "4.0 hrs.",
    highlights: [
      "Historical significance",
      "Panoramic views",
      "Cultural exhibitions",
      "Hiking opportunities",
    ],
  ),
  Recommendation(
    name: "Grand Canyon",
    description:
        "The Grand Canyon is a steep-sided canyon carved by the Colorado River in Arizona, United States.",
    cost: "₹35.0",
    duration: "3.5 hrs.",
    highlights: [
      "Spectacular geological formations",
      "Rafting on the Colorado River",
      "Hiking trails",
      "Helicopter tours",
    ],
  ),
];

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(
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
      panelDividedLeft: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ResponseItemCard(
                title: recommendations[index].name,
                description: recommendations[index].description,
                label: recommendations[index].duration,
                selected: _selected == index,
                onTap: () {
                  setState(() {
                    _selected = index;
                  });
                  moveToPlace(_controller, const LatLng(21, 214));
                },
              ),
              if (index < recommendations.length - 1) const SizedBox(height: 8)
            ],
          );
        },
      ),
      panelRight: RecommendationDetailsCard(
        recommendation: recommendations[_selected],
      ),
    );
  }
}
