import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/budget_plan.dart';

class TableRowRouteCard extends StatelessWidget {
  final TravelRoute _route;
  final bool _selected;
  final int _index;
  final int _totalRoutes;
  final Function(int) _onRouteTap;

  const TableRowRouteCard({super.key,
    required TravelRoute route,
    required bool selected,
    required int index,
    required int totalRoutes,
    required dynamic Function(int) onRouteTap,
  })  : _onRouteTap = onRouteTap,
        _totalRoutes = totalRoutes,
        _index = index,
        _selected = selected,
        _route = route;

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
                Expanded(flex: 25, child: Text("From", style: headerStyle)),
                Expanded(flex: 25, child: Text("To", style: headerStyle)),
                Expanded(flex: 25, child: Text("Mode", style: headerStyle)),
                Expanded(flex: 25, child: Text("Cost", style: headerStyle)),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            _onRouteTap(_index);
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  _index == _totalRoutes - 1 ? 10 : 0,
                ),
                bottomRight: Radius.circular(
                  _index == _totalRoutes - 1 ? 10 : 0,
                ),
              ),
              color: _selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
            ),
            duration: const Duration(milliseconds: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTableCell(_route.from, _selected),
                _buildTableCell(_route.to, _selected),
                _buildTableCell(_route.mode, _selected),
                _buildTableCell(_route.cost, _selected),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String label, bool selected) {
    final style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: selected ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
    );

    return Expanded(
      flex: 25,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      ),
    );
  }
}
