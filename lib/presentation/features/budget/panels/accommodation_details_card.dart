import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';

class AccommodationDetailsCard extends StatelessWidget {
  final Accommodation _accommodation;

  const AccommodationDetailsCard({
    super.key,
    required Accommodation accommodation,
  }) : _accommodation = accommodation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _accommodation.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Duration",
            description: _accommodation.duration,
          ),
          ItemTitleDescription(
            title: "Cost per night",
            description: _accommodation.costPerNight,
          ),
          ItemTitleDescription(
            title: "Total cost",
            description: _accommodation.totalCost,
          ),
          ItemTitleDescription(
            title: "Description",
            description: _accommodation.description,
          ),
        ],
      ),
    );
  }
}
