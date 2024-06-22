import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../config/theme/color/app_color.dart';

class ColorCard extends StatelessWidget {
  final AppColor _color;
  final bool _selected;
  final Function _onTap;

  const ColorCard({
    super.key,
    required AppColor color,
    required bool selected,
    required Function onTap,
  })  : _onTap = onTap,
        _selected = selected,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selected ? _color.shade500 : _color.shade900,
        ),
        child: _selected
            ? Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 18,
                  color: AppTheme.gray.shade300,
                ),
              )
            : Container(),
      ),
    );
  }
}
