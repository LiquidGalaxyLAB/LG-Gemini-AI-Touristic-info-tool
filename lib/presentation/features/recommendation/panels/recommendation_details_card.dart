import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/data_utils.dart';
import '../../../../domain/model/recommendation.dart';
import '../../../components/item_title_description.dart';

class RecommendationDetailsCard extends StatelessWidget {
  final Recommendation _recommendation;

  const RecommendationDetailsCard({
    super.key,
    required Recommendation recommendation,
  }) : _recommendation = recommendation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _recommendation.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ItemTitleDescription(
                title: "Cost",
                description: _recommendation.cost,
              ),
              const SizedBox(width: 48),
              ItemTitleDescription(
                title: "Duration",
                description: _recommendation.duration,
              ),
            ],
          ),
          ItemTitleDescription(
            title: "Description",
            description: _recommendation.description,
          ),
          ItemTitleDescription(
            title: "Highlights",
            description: listToBulletPoints(_recommendation.highlights),
            spacing: false,
          ),
        ],
      ),
    );
  }
}
