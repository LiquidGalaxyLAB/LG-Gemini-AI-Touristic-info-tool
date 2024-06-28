import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';

class TableRowAccommodationCard extends StatelessWidget {
  final Accommodation _accommodation;
  final bool _selected;
  final int _index;
  final int _totalAccommodation;
  final Function(int) _onAccommodationTap;

  const TableRowAccommodationCard({
    super.key,
    required Accommodation accommodation,
    required bool selected,
    required int index,
    required int totalAccommodation,
    required dynamic Function(int) onAccommodationTap,
  })  : _onAccommodationTap = onAccommodationTap,
        _totalAccommodation = totalAccommodation,
        _index = index,
        _selected = selected,
        _accommodation = accommodation;

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
                Flexible(flex: 3, child: Text("Name", style: headerStyle)),
                const SizedBox(width: 12),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Duration", style: headerStyle),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Per night", style: headerStyle),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Total", style: headerStyle),
                  ),
                ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            _onAccommodationTap(_index);
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _index == _totalAccommodation - 1 ? 10 : 0,
                ),
                bottomRight: Radius.circular(
                  _index == _totalAccommodation - 1 ? 10 : 0,
                ),
              ),
              color: _selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
            ),
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 3, child: _buildTableCell(_accommodation.name, _selected)),
                const SizedBox(width: 12),
                Flexible(flex: 2, child: _buildTableCell(_accommodation.duration, _selected)),
                const SizedBox(width: 12),
                Flexible(flex: 2, child: _buildTableCell(_accommodation.costPerNight, _selected)),
                const SizedBox(width: 12),
                Flexible(flex: 2, child: _buildTableCell(_accommodation.totalCost, _selected)),
              ],
            ),
          ),
        ),
        if (_index != _totalAccommodation - 1)
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
