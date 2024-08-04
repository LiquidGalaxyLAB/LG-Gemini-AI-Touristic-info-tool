import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/itinerary.dart';
import '../../../components/item_title_description.dart';
import '../widgets/table_row_place_card.dart';
import '../widgets/table_row_route_card.dart';

class MainResponseCard extends StatefulWidget {
  final Itinerary _itinerary;
  final Function(bool) _onTap;
  final Function(int) _onRouteTap;
  final Function(int) _onPlaceTap;
  final int _selectedPlace;
  final int _selectedRoute;
  final bool _showRouteTable;

  const MainResponseCard({
    super.key,
    required dynamic Function(bool) onTap,
    required dynamic Function(int) onPlaceTap,
    required dynamic Function(int) onRouteTap,
    required Itinerary itinerary,
    required int selectedPlace,
    required int selectedRoute,
    required bool showRouteTable,
  })  : _showRouteTable = showRouteTable,
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
  bool showRoute = true;

  @override
  void initState() {
    super.initState();
    showRoute = widget._showRouteTable;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: ItemTitleDescription(
                  title: "Name",
                  description: widget._itinerary.name,
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppTheme.color.shade700),
                ),
                highlightColor: AppTheme.color.shade500,
                onPressed: () {
                  widget._onTap(!showRoute);
                  showRoute = !showRoute;
                },
                icon: Icon(
                  showRoute ? Icons.location_on_rounded : Icons.route_rounded,
                  size: 20,
                  color: AppTheme.color.shade50,
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
