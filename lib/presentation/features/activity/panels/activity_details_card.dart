import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/data_utils.dart';
import '../../../../domain/model/activitiy.dart';
import '../../../components/item_title_description.dart';

class ActivityDetailsCard extends StatelessWidget {
  final Activity _activity;

  const ActivityDetailsCard({
    super.key,
    required Activity activity,
  }) : _activity = activity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _activity.name,
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
                description: _activity.cost,
              ),
              const SizedBox(width: 48),
              ItemTitleDescription(
                title: "Duration",
                description: _activity.duration,
              ),
            ],
          ),
          ItemTitleDescription(
            title: "Description",
            description: _activity.description,
          ),
          ItemTitleDescription(
            title: "Procedure",
            description: listToBulletPoints(_activity.procedure),
          ),
          ItemTitleDescription(
            title: "Precautions",
            description: listToBulletPoints(_activity.precautions),
            spacing: false,
          ),
        ],
      ),
    );
  }
}
