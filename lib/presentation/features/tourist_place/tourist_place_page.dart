import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/tourist_place.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'panels/tourist_place_details_card.dart';
import 'panels/tourist_place_input_card.dart';

class TouristPlacePage extends StatefulWidget {
  const TouristPlacePage({super.key});

  @override
  State<TouristPlacePage> createState() => _TouristPlacePageState();
}

class _TouristPlacePageState extends State<TouristPlacePage> {
  var _selected = 0;
  List<TouristPlace> touristPlaces = [];
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    final random = Random();
    for (int i = 0; i < 10; i++) {
      touristPlaces.add(TouristPlace(
        name: "Beautiful Place$i",
        location: "Haryana",
        latitude: double.parse((random.nextDouble() * 1000).toStringAsFixed(2)),
        longitude: double.parse((random.nextDouble() * 100).toStringAsFixed(2)),
        history: "This place has a rich history...",
        significance: "It is significant because...",
        cuisine: "Famous for its delicious cuisine...",
        specialty: "Known for its unique specialty...",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: CameraPosition(
        target: LatLng(
          touristPlaces[_selected].latitude,
          touristPlaces[_selected].longitude,
        ),
        zoom: 7,
      ),
      controller: _controller,
      panelLeft: TouristPlaceInputCard(
        onContinueClick: () {},
      ),
      panelDividedLeft: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: touristPlaces.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ResponseItemCard(
                title: touristPlaces[index].name,
                description: touristPlaces[index].specialty,
                label:
                    "(${touristPlaces[index].latitude}, ${touristPlaces[index].longitude})",
                selected: _selected == index,
                onTap: () {
                  setState(() {
                    _selected = index;
                  });
                  moveToPlace(
                    _controller,
                    LatLng(
                      touristPlaces[_selected].longitude,
                      touristPlaces[_selected].latitude,
                    ),
                  );
                },
              ),
              if (index < touristPlaces.length - 1) const SizedBox(height: 8)
            ],
          );
        },
      ),
      panelRight: TouristPlaceDetailsCard(
        touristPlace: touristPlaces[_selected],
        liked: false,
        onIconClick: () {},
      ),
    );
  }
}
