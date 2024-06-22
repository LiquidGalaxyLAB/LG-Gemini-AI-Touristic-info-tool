import 'package:flutter/material.dart';
import 'package:touristic/domain/model/tourist_place.dart';

import '../../../../config/theme/app_theme.dart';

class FavouriteCard extends StatelessWidget {
  final Function _onTap;
  final bool _selected;
  final TouristPlace _touristPlace;

  const FavouriteCard({
    super.key,
    required TouristPlace touristPlace,
    required bool selected,
    required Function onTap,
  })  : _onTap = onTap,
        _selected = selected,
        _touristPlace = touristPlace;

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
                Text(
                  _touristPlace.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: _selected
                        ? AppTheme.gray.shade200
                        : AppTheme.gray.shade400,
                  ),
                ),
                Text(
                  "(${_touristPlace.latitude}, ${_touristPlace.longitude})",
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
              _touristPlace.specialty,
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
