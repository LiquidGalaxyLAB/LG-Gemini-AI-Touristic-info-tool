import 'package:flutter/material.dart';
import 'package:touristic/config/theme/app_theme.dart';

class ItemCardDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool selected;
  final bool expanded;

  const ItemCardDashboard({
    super.key,
    required this.title,
    required this.iconData,
    required this.selected,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.up,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selected ? AppTheme.purple40 : AppTheme.blue70,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              iconData,
              size: 18,
              color: selected ? AppTheme.gray10 : AppTheme.gray10,
            ),
          ),

          if (expanded)
          const SizedBox(
            width: 10,
          ),

          if (expanded)
          Text(
            title,
            style: TextStyle(
              color: selected ? AppTheme.gray10 : AppTheme.gray30,
              fontFamily: "Noto",
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
