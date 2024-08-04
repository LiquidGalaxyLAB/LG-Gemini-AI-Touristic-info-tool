import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/tourist_place.dart';
import '../../../service/lg_service.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'bloc/favourites_bloc.dart';
import 'bloc/favourites_event.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<FavouritesBloc>(context).add(const GetFavourites());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: _touristPlaces.isNotEmpty
          ? CameraPosition(
              target: LatLng(
                _touristPlaces[_selected].latitude,
                _touristPlaces[_selected].longitude,
              ),
              zoom: 7,
            )
          : null,
      controller: _controller,
      onMapOrbitButtonTap: () async {
        await LGService().sendTour(
          "Orbit",
          KmlUtils.orbitAround(
            LatLng(
              _touristPlaces[_selected].latitude,
              _touristPlaces[_selected].longitude,
            ),
          ),
        );
        await LGService().startOrbit();
      },
      panelLeft: blocBuilder<FavouritesBloc, T>(onSuccess: (result) {
        _touristPlaces = result;
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
                  onTap: () async {
                    setState(() {
                      _selected = index;
                    });
                    await LGService().sendKml(KmlUtils.createCircle(LatLng(
                      _touristPlaces[_selected].latitude,
                      _touristPlaces[_selected].longitude,
                    )));
                    await moveToPlace(
                      _controller,
                      LatLng(
                        _touristPlaces[_selected].latitude,
                        _touristPlaces[_selected].longitude,
                      ),
                      tilt: tilt,
                    );
                  },
                ),
                if (index < _touristPlaces.length - 1) const SizedBox(height: 8)
              ],
            );
          },
        );
      }),
      panelRight: blocBuilder<FavouritesBloc, T>(
        onSuccess: (result) {
          LGService().showBalloon(result[_selected].generateBalloon());
          return result.isNotEmpty
              ? FavouriteDetailsCard(
                  touristPlace: result[_selected],
                  liked: true,
                  onIconClick: (place, isLiked) {
                    if (isLiked) {
                      BlocProvider.of<FavouritesBloc>(context).add(
                        AddFavourite(place),
                      );
                    } else {
                      if (_touristPlaces.isNotEmpty) {
                        _selected = 0;
                        _touristPlaces.removeAt(_selected);
                        BlocProvider.of<FavouritesBloc>(context).add(
                          RemoveFavourite(place),
                        );
                      }
                    }
                  },
                )
              : Container();
        },
      ),
    );
  }
}
