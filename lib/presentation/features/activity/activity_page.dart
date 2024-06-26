import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/activitiy.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'panels/activity_details_card.dart';
import 'panels/activity_input_card.dart';

const activities = [
  Activity(
    name: "Scuba Diving",
    description:
        "Explore the underwater world with a guided scuba diving tour.",
    procedure: [
      "Attend a safety briefing.",
      "Put on the scuba gear.",
      "Enter the water with the instructor.",
      "Dive and explore the underwater scenery."
    ],
    precautions: [
      "Ensure you are medically fit for diving.",
      "Follow the instructor's guidance at all times.",
      "Do not touch or disturb marine life.",
      "Ascend slowly to avoid decompression sickness."
    ],
    duration: "3 min.",
    cost: "₹150.0",
  ),
  Activity(
    name: "City Tour",
    description:
        "A guided tour of the city's historical landmarks and attractions.",
    procedure: [
      "Meet at the designated starting point.",
      "Board the tour bus.",
      "Visit various landmarks and attractions.",
      "Enjoy a lunch break at a local restaurant.",
      "Return to the starting point."
    ],
    precautions: [
      "Wear comfortable walking shoes.",
      "Stay with the group at all times.",
      "Follow the guide's instructions.",
      "Carry water and stay hydrated."
    ],
    duration: "5 min.",
    cost: "₹75.0",
  ),
  Activity(
    name: "Mountain Hiking",
    description:
        "A challenging hike to the summit of the mountain with stunning views.",
    procedure: [
      "Meet at the trailhead.",
      "Review the hiking route and safety tips.",
      "Begin the hike with the group.",
      "Take breaks as needed.",
      "Reach the summit and enjoy the view.",
      "Descend back to the trailhead."
    ],
    precautions: [
      "Wear appropriate hiking gear and footwear.",
      "Carry sufficient water and snacks.",
      "Be aware of your surroundings.",
      "Do not hike alone.",
      "Check the weather forecast before starting."
    ],
    duration: "6 min.",
    cost: "₹20.0",
  ),
];

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition:
          const CameraPosition(target: LatLng(12.0, 412.2), zoom: 7),
      controller: _controller,
      panelLeft: ActivityInputCard(onContinueClick: () {}),
      panelDividedLeft: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ResponseItemCard(
                title: activities[index].name,
                description: activities[index].description,
                label: activities[index].duration,
                selected: _selected == index,
                onTap: () {
                  setState(() {
                    _selected = index;
                  });
                  moveToPlace(_controller, const LatLng(21, 214));
                },
              ),
              if (index < activities.length - 1) const SizedBox(height: 8)
            ],
          );
        },
      ),
      panelRight: ActivityDetailsCard(
        activity: activities[_selected],
      ),
    );
  }
}
