import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/maps_utils.dart';
import '../../../../domain/model/itinerary.dart';
import '../../../components/item_title_description.dart';
import '../../../components/response_item_card.dart';

class MainResponseCard extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final Itinerary _itinerary;
  final Function(bool) _onTap;
  final Function(int) _onRouteTap;
  final Function(int) _onPlaceTap;
  final int _selectedPlace;
  final int _selectedRoute;
  final bool _showRouteTable;

  const MainResponseCard({
    super.key,
    required Completer<GoogleMapController> controller,
    required dynamic Function(bool) onTap,
    required dynamic Function(int) onPlaceTap,
    required dynamic Function(int) onRouteTap,
    required Itinerary itinerary,
    required int selectedPlace,
    required int selectedRoute,
    required bool showRouteTable,
  })  : _controller = controller,
        _showRouteTable = showRouteTable,
        _selectedRoute = selectedRoute,
        _selectedPlace = selectedPlace,
        _itinerary = itinerary,
        _onTap = onTap,
        _onPlaceTap = onPlaceTap,
        _onRouteTap = onRouteTap;

  @override
  State<MainResponseCard> createState() => _MainResponseCardState();
}

class _MainResponseCardState extends State<MainResponseCard> {
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
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  value: widget._showRouteTable,
                  onChanged: (value) {
                    widget._onTap(value == true);
                  },
                  activeColor: AppTheme.color.shade700,
                  checkColor: AppTheme.gray.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
              itemCount: widget._showRouteTable
                  ? widget._itinerary.travelRoute.length
                  : widget._itinerary.places.length,
              itemBuilder: (context, index) {
                return widget._showRouteTable
                    ? _buildTableRow(
                        widget._itinerary.travelRoute[index],
                        widget._selectedRoute == index,
                        index,
                      )
                    : Column(
                        children: [
                          ResponseItemCard(
                            title: widget._itinerary.places[index].name,
                            description:
                                widget._itinerary.places[index].description,
                            label:
                                "${widget._itinerary.places[index].latitude}, ${widget._itinerary.places[index].latitude}",
                            selected: widget._selectedPlace == index,
                            onTap: () {
                              widget._onPlaceTap(index);
                              moveToPlace(
                                widget._controller,
                                LatLng(
                                  widget._itinerary.places[index].latitude,
                                  widget._itinerary.places[index].latitude,
                                ),
                              );
                            },
                          ),
                          if (index < widget._itinerary.places.length - 1)
                            const SizedBox(height: 8)
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(
    TravelRoute route,
    bool selected,
    int index,
  ) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: selected ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
    );

    final headerStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppTheme.gray.shade300,
    );

    return Column(
      children: [
        if (index == 0)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppTheme.gray.shade700,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mode", style: headerStyle),
                Text("From", style: headerStyle),
                Text("To", style: headerStyle),
                Text("Duration", style: headerStyle),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            widget._onRouteTap(index);
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  index == widget._itinerary.travelRoute.length - 1 ? 10 : 0,
                ),
                bottomRight: Radius.circular(
                  index == widget._itinerary.travelRoute.length - 1 ? 10 : 0,
                ),
              ),
              color:
                  selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
            ),
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(route.mode,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
                Text(route.from,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
                Text(route.to,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
                Text(route.duration,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
