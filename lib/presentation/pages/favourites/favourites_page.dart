import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/config/theme/app_theme.dart';
import 'package:touristic/domain/model/tourist_place.dart';
import 'package:touristic/presentation/pages/favourites/panels/favourite_card.dart';
import 'package:touristic/presentation/pages/favourites/panels/favourite_details_card.dart';
import 'package:touristic/presentation/panel/maps_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var _selected = 0;
  List<TouristPlace> favourites = [];
  static const double spacing = 12.0;
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  // final CameraPosition _cameraPosition = CameraPosition(
  //   target: LatLng(
  //     favourites[_selected].longitude,
  //     favourites[_selected].latitude,
  //   ),
  //   zoom: 14.4746,
  // );

  @override
  void initState() {
    super.initState();
    final random = Random();
    for (int i = 0; i < 10; i++) {
      favourites.add(TouristPlace(
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
    return Container(
      color: AppTheme.gray.shade900,
      padding: const EdgeInsets.all(spacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: _buildFavouriteList(favourites),
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
                        favourites[_selected].longitude,
                        favourites[_selected].latitude,
                      ),
                      zoom: 7,
                    ),
                    controller: _controller,
                  ),
                ),
                const SizedBox(height: spacing),
                Flexible(
                  flex: 5,
                  child: FavouriteDetailsCard(
                    touristPlace: favourites[_selected],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFavouriteList(List<TouristPlace> favourites,) {
    return Container(
      padding: const EdgeInsets.all(spacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.gray.shade800,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: favourites.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                FavouriteCard(
                  touristPlace: favourites[index],
                  selected: _selected == index,
                  onTap: () {
                    setState(() {
                      _selected = index;
                    });
                    _goToFavourite();
                  },
                ),
                if (index < favourites.length - 1) const SizedBox(height: 8)
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _goToFavourite() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
          favourites[_selected].longitude,
          favourites[_selected].latitude,
        ),
        zoom: 7,
      ),),
    );
  }
}
