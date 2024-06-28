import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/maps_utils.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';
import '../widgets/table_row_place_card.dart';
import '../widgets/table_row_route_card.dart';

class MainResponseCard extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final Itinerary _itinerary;
  final Function(bool) _onTap;
  final Function(int) _onRouteTap;
  final Function(int) _onPlaceTap;
  final Function(int) _onExpenseTap;
  final Function(int) _onAccommodationTap;
  final int _selectedPlace;
  final int _selectedRoute;
  final bool _showRouteTable;

  const MainResponseCard({
    super.key,
    required Completer<GoogleMapController> controller,
    required dynamic Function(bool) onTap,
    required dynamic Function(int) onPlaceTap,
    required dynamic Function(int) onRouteTap,
    required dynamic Function(int) onExpenseTap,
    required dynamic Function(int) onAccommodationTap,
    required Itinerary itinerary,
    required int selectedPlace,
    required int selectedRoute,
    required bool showRouteTable,
  })  : _controller = controller,
        _showRouteTable = showRouteTable,
        _selectedRoute = selectedRoute,
        _selectedPlace = selectedPlace,
        _onAccommodationTap = onAccommodationTap,
        _onExpenseTap = onExpenseTap,
        _itinerary = itinerary,
        _onTap = onTap,
        _onPlaceTap = onPlaceTap,
        _onRouteTap = onRouteTap;

  @override
  State<MainResponseCard> createState() => _MainResponseCardState();
}

class _MainResponseCardState extends State<MainResponseCard> {
  int state = 0;
  List<IconData> icons = [
    Icons.location_on_rounded, Icons.route_rounded, Icons.emoji_food_beverage_rounded, Icons.hotel_rounded
  ];

  @override
  void initState() {
    super.initState();
    // showRoute = widget._showRouteTable;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemTitleDescription(
                title: "Name",
                description: widget._itinerary.name,
              ),
              IconButton(
                onPressed: () {
                  state = (state + 1) % icons.length;
                  // widget._onTap(!showRoute);
                  // showRoute = !showRoute;
                },
                icon: Icon(
                  icons[state],
                  size: 24,
                  color: AppTheme.color.shade600,
                ),
              ),
            ],
          ),
          ItemTitleDescription(
            title: "Starting Point",
            description: widget._itinerary.startingPoint,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount:
                  widget._showRouteTable ? widget._itinerary.travelRoute.length : widget._itinerary.places.length,
              itemBuilder: (context, index) {
                return widget._showRouteTable
                    ? TableRowRouteCard(
                        route: widget._itinerary.travelRoute[index],
                        selected: widget._selectedRoute == index,
                        index: index,
                        totalRoutes: widget._itinerary.travelRoute.length,
                        onRouteTap: (int tappedIndex) {
                          setState(() {
                            widget._onRouteTap(index);
                          });
                        },
                      )
                    : TableRowPlaceCard(
                        place: widget._itinerary.places[index],
                        selected: widget._selectedPlace == index,
                        index: index,
                        totalPlaces: widget._itinerary.places.length,
                        onPlaceTap: (int tappedIndex) {
                          setState(() {
                            widget._onPlaceTap(index);
                            moveToPlace(
                                widget._controller,
                                LatLng(
                                  widget._itinerary.places[index].latitude,
                                  widget._itinerary.places[index].longitude,
                                ));
                          });
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
