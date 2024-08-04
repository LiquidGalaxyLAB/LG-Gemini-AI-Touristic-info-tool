import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/kml_utils.dart';
import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/budget_plan.dart';
import '../../../service/lg_service.dart';
import '../../../service/location_service.dart';
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
  int _selectedDetails = 1;
  BudgetPlan? _budgetPlan;

  LatLng? latLng;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(target: LatLng(22.99899294474381, 78.7274369224906), zoom: 3),
      controller: _controller,
      onMapOrbitButtonTap: () async {
        if (_selectedDetails == 1) {
          await LGService().sendTour(
            "Orbit",
            KmlUtils.orbitAround(
              LatLng(
                _budgetPlan!.places[_selectedPlace].latitude,
                _budgetPlan!.places[_selectedPlace].longitude,
              ),
            ),
          );
          await LGService().startOrbit();
        } else if (latLng != null) {
          await LGService().sendTour(
            "Orbit",
            KmlUtils.orbitAround(latLng!),
          );
          await LGService().startOrbit();
        }
      },
      panelLeft: BudgetInputCard(
        onContinueClick: (params) {
          showErrorDialog = true;
          BlocProvider.of<BudgetPlanBloc>(context).add(GetBudgetPlan(params));
        },
      ),
      panelDividedLeft: blocBuilder<BudgetPlanBloc, T>(onLoading: () {
        _selectedPlace = 0;
        _selectedRoute = 0;
        _selectedExpense = 0;
        _selectedAccommodation = 0;
        _selectedDetails = 1;
      }, onSuccess: (result) {
        _budgetPlan = result;
        LGService().showBalloon(result.generateBalloon());
        LGService().sendKml(
          KmlUtils.createPolyline(
            result.places.map((p) => LatLng(p.latitude, p.longitude)).toList(),
          ),
        );
        return MainResponseCard(
          budgetPlan: _budgetPlan!,
          onTap: (value) {
            setState(() {
              _selectedDetails = value;
            });
          },
          onPlaceTap: (value) async {
            setState(() {
              _selectedPlace = value;
            });
            await LGService().sendKml(KmlUtils.createCircle(
              LatLng(_budgetPlan!.places[value].latitude, _budgetPlan!.places[value].longitude),
            ));
            await moveToPlace(
              _controller,
              LatLng(_budgetPlan!.places[value].latitude, _budgetPlan!.places[value].longitude),
              tilt: tilt,
            );
          },
          onRouteTap: (value) async {
            setState(() {
              _selectedRoute = value;
            });
            latLng = await LocationService().getLatLngFromLocation(_budgetPlan!.travelRoute[value].from);
            if (latLng != null) {
              await LGService().sendKml(KmlUtils.createCircle(latLng!));
              await moveToPlace(_controller, latLng!, tilt: tilt);
            }
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
          place: _budgetPlan!.places[_selectedPlace],
        );
      case 2:
        return AccommodationDetailsCard(
          accommodation: _budgetPlan!.accommodation[_selectedAccommodation],
        );
      case 3:
        return AdditionalExpensesDetailsCard(
          additionalExpense: _budgetPlan!.additionalExpenses[_selectedExpense],
        );
      default:
        return RouteDetailsCard(
          route: _budgetPlan!.travelRoute[_selectedRoute],
        );
    }
  }
}
