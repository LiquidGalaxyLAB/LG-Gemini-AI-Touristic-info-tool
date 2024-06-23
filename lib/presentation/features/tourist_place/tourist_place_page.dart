import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/tourist_place.dart';
import '../../components/layout_blueprint.dart';
import '../../components/tourist_place_card.dart';
import '../../components/tourist_place_details_card.dart';
import '../../components/user_input_card.dart';

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
      panelLeft: UserInputCard(
        onContinueClick: () {},
      ),
      panelDividedLeft: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: touristPlaces.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TouristPlaceCard(
                touristPlace: touristPlaces[index],
                selected: _selected == index,
                onTap: () {
                  setState(() {
                    _selected = index;
                  });
                  _goToTouristPlace();
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

  Future<void> _goToTouristPlace() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            touristPlaces[_selected].longitude,
            touristPlaces[_selected].latitude,
          ),
          zoom: 7,
        ),
      ),
    );
  }
}
