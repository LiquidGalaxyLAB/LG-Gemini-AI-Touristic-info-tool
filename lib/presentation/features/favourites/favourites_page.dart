import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/tourist_place.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'panels/favourite_details_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
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
      panelLeft: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ListView.builder(
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
      ),
      panelRight: FavouriteDetailsCard(
        touristPlace: touristPlaces[_selected],
        liked: true,
        onIconClick: () {},
      ),
    );
  }
}
