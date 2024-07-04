import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class ItemTitleDescription extends StatelessWidget {
  final String _title;
  final String _description;
  final bool? _spacing;

  const ItemTitleDescription({
    super.key,
    required String title,
    required String description,
    bool? spacing,
  })  : _description = description,
        _spacing = spacing,
        _title = title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppTheme.gray.shade400,
            ),
          ),
          Text(
            _description,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppTheme.gray.shade300,
            ),
          ),
          if (_spacing != false) const SizedBox(height: 12)
        ],
      ),
    );
  }
}
