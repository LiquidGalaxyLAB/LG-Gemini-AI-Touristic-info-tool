import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';

class PlaceDetailsCard extends StatelessWidget {
  final Place _place;

  const PlaceDetailsCard({
    super.key,
    required Place place,
  }) : _place = place;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _place.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Entrance Cost",
            description: _place.entranceFee,
          ),
          ItemTitleDescription(
            title: "Guided Tour Cost",
            description: _place.guidedTourFee,
          ),
          ItemTitleDescription(
            title: "Average Meal Cost",
            description: _place.averageMealCost,
          ),
        ],
      ),
    );
  }
}
