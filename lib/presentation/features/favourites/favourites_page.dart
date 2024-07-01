import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../di/dependency_injection.dart';
import '../../../domain/model/tourist_place.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'bloc/favourites_bloc.dart';
import 'panels/favourite_details_card.dart';

typedef T = List<TouristPlace>;

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var _selected = 0;
  List<TouristPlace> _touristPlaces = [];
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FavouritesBloc>(),
      child: LayoutBlueprint(
        cameraPosition: _touristPlaces.isNotEmpty ? CameraPosition(
          target: LatLng(
            _touristPlaces[_selected].latitude,
            _touristPlaces[_selected].longitude,
          ),
          zoom: 7,
        ) : null,
        controller: _controller,
        panelLeft: blocBuilder<FavouritesBloc, T>(onSuccess: (result) {
          setState(() {
            _touristPlaces = result;
          });

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _touristPlaces.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ResponseItemCard(
                    title: _touristPlaces[index].name,
                    description: _touristPlaces[index].specialty,
                    label: "(${_touristPlaces[index].latitude}, ${_touristPlaces[index].longitude})",
                    selected: _selected == index,
                    onTap: () {
                      setState(() {
                        _selected = index;
                      });
                      moveToPlace(
                        _controller,
                        LatLng(
                          _touristPlaces[_selected].longitude,
                          _touristPlaces[_selected].latitude,
                        ),
                      );
                    },
                  ),
                  if (index < _touristPlaces.length - 1) const SizedBox(height: 8)
                ],
              );
            },
          );
        }),
        panelRight: blocBuilder<FavouritesBloc, T>(onSuccess: (result) {
          return FavouriteDetailsCard(
            touristPlace: _touristPlaces[_selected],
            liked: true,
            onIconClick: () {},
          );
        }),
      ),
    );
  }
}
