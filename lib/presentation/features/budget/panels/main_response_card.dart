import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';
import '../widgets/table_row_accommodation_card.dart';
import '../widgets/table_row_additional_card.dart';
import '../widgets/table_row_place_card.dart';
import '../widgets/table_row_route_card.dart';

class MainResponseCard extends StatefulWidget {
  final BudgetPlan _budgetPlan;
  final Function(int) _onTap;
  final Function(int) _onRouteTap;
  final Function(int) _onPlaceTap;
  final Function(int) _onExpenseTap;
  final Function(int) _onAccommodationTap;
  final int _selectedPlace;
  final int _selectedRoute;
  final int _selectedExpense;
  final int _selectedAccommodation;
  final int _selectedDetails;

  const MainResponseCard({
    super.key,
    required dynamic Function(int) onTap,
    required dynamic Function(int) onPlaceTap,
    required dynamic Function(int) onRouteTap,
    required dynamic Function(int) onExpenseTap,
    required dynamic Function(int) onAccommodationTap,
    required BudgetPlan budgetPlan,
    required int selectedPlace,
    required int selectedRoute,
    required int selectedExpense,
    required int selectedAccommodation,
    required int selectedDetails,
  })  : _selectedRoute = selectedRoute,
        _selectedPlace = selectedPlace,
        _onAccommodationTap = onAccommodationTap,
        _onExpenseTap = onExpenseTap,
        _budgetPlan = budgetPlan,
        _onTap = onTap,
        _onPlaceTap = onPlaceTap,
        _onRouteTap = onRouteTap,
        _selectedExpense = selectedExpense,
        _selectedAccommodation = selectedAccommodation,
        _selectedDetails = selectedDetails;

  @override
  State<MainResponseCard> createState() => _MainResponseCardState();
}

class _MainResponseCardState extends State<MainResponseCard> {
  int state = 0;
  final List<IconData> _icons = [
    Icons.location_on_rounded,
    Icons.hotel_rounded,
    Icons.emoji_food_beverage_rounded,
    Icons.route_rounded,
  ];

  final List<String> _titles = [
    "Route", "Places", "Accommodation", "Additional"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ItemTitleDescription(
                  title: "Name",
                  description: widget._budgetPlan.name,
                ),
              ),
              IconButton(
                onPressed: () {
                  state = (state + 1) % _icons.length;
                  widget._onTap(state);
                },
                icon: Icon(
                  _icons[state],
                  size: 24,
                  color: AppTheme.color.shade600,
                ),
              ),
            ],
          ),
          ItemTitleDescription(
            title: "Total cost",
            description: widget._budgetPlan.totalCost,
          ),
          Text(
            _titles[widget._selectedDetails],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.gray.shade400,
            ),
          ),
          const SizedBox(height: 6.0),
          Flexible(
            child: _buildResponseWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseWidget() {
    switch (widget._selectedDetails) {
      case 1:
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget._budgetPlan.places.length,
          itemBuilder: (context, index) {
            return TableRowPlaceCard(
              place: widget._budgetPlan.places[index],
              selected: widget._selectedPlace == index,
              index: index,
              totalPlaces: widget._budgetPlan.places.length,
              onPlaceTap: (int tappedIndex) {
                setState(() {
                  widget._onPlaceTap(index);
                });
              },
            );
          },
        );
      case 2:
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget._budgetPlan.accommodation.length,
          itemBuilder: (context, index) {
            return TableRowAccommodationCard(
              accommodation: widget._budgetPlan.accommodation[index],
              selected: widget._selectedAccommodation == index,
              index: index,
              totalAccommodation: widget._budgetPlan.accommodation.length,
              onAccommodationTap: (int tappedIndex) {
                setState(() {
                  widget._onAccommodationTap(index);
                });
              },
            );
          },
        );
      case 3:
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget._budgetPlan.additionalExpenses.length,
          itemBuilder: (context, index) {
            return TableRowAdditionalCard(
              expense: widget._budgetPlan.additionalExpenses[index],
              selected: widget._selectedExpense == index,
              index: index,
              totalExpenses: widget._budgetPlan.additionalExpenses.length,
              onExpenseTap: (int tappedIndex) async {
                setState(() {
                  widget._onExpenseTap(index);
                });
              },
            );
          },
        );
      default:
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget._budgetPlan.travelRoute.length,
          itemBuilder: (context, index) {
            return TableRowRouteCard(
              route: widget._budgetPlan.travelRoute[index],
              selected: widget._selectedRoute == index,
              index: index,
              totalRoutes: widget._budgetPlan.travelRoute.length,
              onRouteTap: (int tappedIndex) {
                setState(() {
                  widget._onRouteTap(index);
                });
              },
            );
          },
        );
    }
  }
}
