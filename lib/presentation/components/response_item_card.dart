import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class ResponseItemCard extends StatelessWidget {
  final Function _onTap;
  final bool _selected;
  final String _title;
  final String _description;
  final String? _label;

  const ResponseItemCard({
    super.key,
    required bool selected,
    required Function onTap,
    required String title,
    required String description,
    String? label,
  })  : _label = label,
        _description = description,
        _title = title,
        _onTap = onTap,
        _selected = selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
        ),
        duration: const Duration(milliseconds: 250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    _title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _selected
                          ? AppTheme.gray.shade200
                          : AppTheme.gray.shade400,
                    ),
                  ),
                ),
                if (_label != null)
                  Text(
                    _label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: _selected
                          ? AppTheme.gray.shade300
                          : AppTheme.gray.shade600,
                    ),
                  ),
              ],
            ),
            Text(
              _description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color:
                    _selected ? AppTheme.gray.shade200 : AppTheme.gray.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
