import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';

class TableRowAdditionalCard extends StatelessWidget {
  final AdditionalExpense _expense;
  final bool _selected;
  final int _index;
  final int _totalExpenses;
  final Function(int) _onExpanseTap;

  const TableRowAdditionalCard({
    super.key,
    required AdditionalExpense expense,
    required bool selected,
    required int index,
    required int totalExpanses,
    required dynamic Function(int) onExpenseTap,
  })  : _onExpanseTap = onExpenseTap,
        _totalExpenses = totalExpanses,
        _index = index,
        _selected = selected,
        _expense = expense;

  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppTheme.gray.shade300,
    );

    return Column(
      children: [
        if (_index == 0)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppTheme.gray.shade700,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 6, child: Text("Name", style: headerStyle)),
                const SizedBox(width: 12),
                Flexible(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Cost", style: headerStyle),
                  ),
                ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            _onExpanseTap(_index);
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _index == _totalExpenses - 1 ? 10 : 0,
                ),
                bottomRight: Radius.circular(
                  _index == _totalExpenses - 1 ? 10 : 0,
                ),
              ),
              color: _selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
            ),
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 6, child: _buildTableCell(_expense.name, _selected)),
                const SizedBox(width: 12),
                Flexible(flex: 4, child: _buildTableCell(_expense.estimatedCost, _selected)),
              ],
            ),
          ),
        ),
        if (_index != _totalExpenses - 1)
          Divider(
            height: 1,
            color: AppTheme.gray.shade800,
          )
      ],
    );
  }

  Widget _buildTableCell(String label, bool selected) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: selected ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
