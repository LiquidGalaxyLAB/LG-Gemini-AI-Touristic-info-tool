import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../components/item_title_description.dart';

class AdditionalExpensesDetailsCard extends StatelessWidget {
  final AdditionalExpense _additionalExpense;

  const AdditionalExpensesDetailsCard({
    super.key,
    required AdditionalExpense additionalExpense,
  }) : _additionalExpense = additionalExpense;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _additionalExpense.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Estimated Cost",
            description: _additionalExpense.estimatedCost,
          ),
          ItemTitleDescription(
            title: "Description",
            description: _additionalExpense.description,
          ),
        ],
      ),
    );
  }
}
