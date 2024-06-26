import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class ImageCard extends StatelessWidget {
  final String _name;
  final bool _selected;
  final Function _onTap;
  final double _scale;

  const ImageCard(
      {super.key,
      required String name,
      required bool selected,
      required Function onTap,
      double scale = 1})
      : _onTap = onTap,
        _selected = selected,
        _name = name,
        _scale = scale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 100,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Transform.scale(
                scale: _scale,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(_selected ? 0.2 : 1),
                    BlendMode.dstATop,
                  ),
                  child: Image.asset(
                    _name,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (_selected)
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 28,
                  color: AppTheme.gray.shade300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
