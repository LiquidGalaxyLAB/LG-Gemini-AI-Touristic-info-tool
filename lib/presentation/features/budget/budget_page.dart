import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../domain/model/budget_plan.dart';
import '../../components/layout_blueprint.dart';
import 'bloc/budget_plan_bloc.dart';
import 'bloc/budget_plan_event.dart';
import 'panels/accommodation_details_card.dart';
import 'panels/additional_expenses_details_card.dart';
import 'panels/budget_input_card.dart';
import 'panels/main_response_card.dart';
import 'panels/place_details_card.dart';
import 'panels/route_details_card.dart';

typedef T = BudgetPlan;

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
  late BudgetPlan _budgetPlan;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(target: LatLng(12.0, 412.2), zoom: 7),
      controller: _controller,
      panelLeft: BudgetInputCard(
        onContinueClick: () {
          BlocProvider.of<BudgetPlanBloc>(context).add(const GetBudgetPlan({}));
        },
      ),
      panelDividedLeft: blocBuilder<BudgetPlanBloc, T>(onSuccess: (result) {
        setState(() {
          _budgetPlan = result;
        });

        return MainResponseCard(
          budgetPlan: _budgetPlan,
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
        );
      }),
      panelRight: blocBuilder<BudgetPlanBloc, T>(onSuccess: (result) {
        return _buildPanelRight();
      }),
    );
  }

  Widget _buildPanelRight() {
    switch (_selectedDetails) {
      case 1:
        return PlaceDetailsCard(
          place: _budgetPlan.places[_selectedPlace],
        );
      case 2:
        return AccommodationDetailsCard(
          accommodation: _budgetPlan.accommodation[_selectedAccommodation],
        );
      case 3:
        return AdditionalExpensesDetailsCard(
          additionalExpense: _budgetPlan.additionalExpenses[_selectedExpense],
        );
      default:
        return RouteDetailsCard(
          route: _budgetPlan.travelRoute[_selectedRoute],
        );
    }
  }
}
