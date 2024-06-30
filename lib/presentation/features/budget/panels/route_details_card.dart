import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';

class RouteDetailsCard extends StatelessWidget {
  final TravelRoute _route;

  const RouteDetailsCard({
    super.key,
    required TravelRoute route,
  }) : _route = route;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            "${_route.from} - ${_route.to}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Duration",
            description: _route.duration,
          ),
          ItemTitleDescription(
            title: "Mode of transportation",
            description: _route.mode,
          ),
          ItemTitleDescription(
            title: "Cost",
            description: _route.cost,
          ),
        ],
      ),
    );
  }
}
