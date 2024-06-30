import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/model/budget_plan.dart';
import '../../components/layout_blueprint.dart';
import 'panels/accommodation_details_card.dart';
import 'panels/additional_expenses_details_card.dart';
import 'panels/budget_input_card.dart';
import 'panels/main_response_card.dart';
import 'panels/place_details_card.dart';
import 'panels/route_details_card.dart';

const budgetPlan = BudgetPlan(
  name: 'Paris and Lyon Trip',
  startingPoint: 'New York',
  travelRoute: [
    TravelRoute(
      mode: 'Flight',
      from: 'New York',
      to: 'Paris',
      cost: '500 USD',
      duration: '7 hours',
    ),
    TravelRoute(
      mode: 'Train',
      from: 'Paris',
      to: 'Lyon',
      cost: '50 USD',
      duration: '2 hours',
    ),
  ],
  places: [
    Place(
      name: 'Eiffel Tower',
      entranceFee: '25 USD',
      guidedTourFee: '30 USD',
      averageMealCost: '20 USD',
    ),
    Place(
      name: 'Louvre Museum',
      entranceFee: '15 USD',
      guidedTourFee: '40 USD',
      averageMealCost: '18 USD',
    ),
  ],
  accommodation: [
    Accommodation(
      name: 'Hotel de Paris',
      description: 'A luxurious hotel in the heart of Paris',
      costPerNight: '150 USD',
      duration: '3 nights',
      totalCost: '450 USD',
    ),
    Accommodation(
      name: 'Lyon Bed & Breakfast',
      description: 'A cozy B&B in Lyon',
      costPerNight: '80 USD',
      duration: '2 nights',
      totalCost: '160 USD',
    ),
  ],
  additionalExpenses: [
    AdditionalExpense(
      name: 'Souvenirs',
      description: 'Gifts and souvenirs',
      estimatedCost: '100 USD',
    ),
    AdditionalExpense(
      name: 'Local Transportation',
      description: 'Metro and bus tickets',
      estimatedCost: '50 USD',
    ),
  ],
  totalCost: '1385 USD',
);

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  int _selectedPlace = 0;
  int _selectedRoute = 0;
  int _selectedExpense = 0;
  int _selectedAccommodation = 0;
  int _selectedDetails = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(target: LatLng(12.0, 412.2), zoom: 7),
      controller: _controller,
      panelLeft: BudgetInputCard(
        onContinueClick: () {},
      ),
      panelDividedLeft: MainResponseCard(
        budgetPlan: budgetPlan,
        controller: _controller,
        onTap: (value) {
          setState(() {
            _selectedDetails = value;
          });
        },
        onPlaceTap: (value) {
          setState(() {
            _selectedPlace = value;
          });
        },
        onRouteTap: (value) {
          setState(() {
            _selectedRoute = value;
          });
        },
        onExpenseTap: (value) {
          setState(() {
            _selectedExpense = value;
          });
        },
        onAccommodationTap: (value) {
          setState(() {
            _selectedAccommodation = value;
          });
        },
        selectedPlace: _selectedPlace,
        selectedRoute: _selectedRoute,
        selectedExpense: _selectedExpense,
        selectedDetails: _selectedDetails,
        selectedAccommodation: _selectedAccommodation,
      ),
      panelRight: _buildPanelRight(),
    );
  }

  Widget _buildPanelRight() {
    switch (_selectedDetails) {
      case 1:
        return PlaceDetailsCard(
          place: budgetPlan.places[_selectedPlace],
        );
      case 2:
        return AccommodationDetailsCard(
          accommodation: budgetPlan.accommodation[_selectedAccommodation],
        );
      case 3:
        return AdditionalExpensesDetailsCard(
          additionalExpense: budgetPlan.additionalExpenses[_selectedExpense],
        );
      default:
        return RouteDetailsCard(
          route: budgetPlan.travelRoute[_selectedRoute],
        );
    }
  }
}
