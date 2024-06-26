import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/data_utils.dart';
import '../../../../domain/model/cuisine.dart';
import '../../../components/item_title_description.dart';

class CuisineDetailsCard extends StatelessWidget {
  final Cuisine _cuisine;

  const CuisineDetailsCard({
    super.key,
    required Cuisine cuisine,
  }) : _cuisine = cuisine;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _cuisine.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Duration",
            description: _cuisine.duration,
          ),
          ItemTitleDescription(
            title: "Aliases",
            description: _cuisine.aliases.map((alias) => alias).join(", "),
          ),
          ItemTitleDescription(
            title: "Description",
            description: _cuisine.description,
          ),
          ItemTitleDescription(
            title: "Origin",
            description: _cuisine.description,
          ),
          ItemTitleDescription(
            title: "Ingredients",
            description: listToBulletPoints(_cuisine.ingredients),
          ),
          ItemTitleDescription(
            title: "Recipe",
            description: listToBulletPoints(_cuisine.recipe),
            spacing: false,
          ),
        ],
      ),
    );
  }
}
