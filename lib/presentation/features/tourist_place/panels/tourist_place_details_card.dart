import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/tourist_place.dart';
import '../../../components/item_title_description.dart';

class TouristPlaceDetailsCard extends StatelessWidget {
  final TouristPlace _touristPlace;
  final bool _liked;
  final Function(TouristPlace, bool) _onIconClick;

  const TouristPlaceDetailsCard({
    super.key,
    required TouristPlace touristPlace,
    required bool liked,
    required Function(TouristPlace, bool) onIconClick,
  })  : _onIconClick = onIconClick,
        _liked = liked,
        _touristPlace = touristPlace;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  _touristPlace.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.gray.shade300,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _onIconClick(_touristPlace, !_liked);
                },
                icon: Icon(
                  _liked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 24,
                  color: _liked
                      ? AppTheme.color.shade600
                      : AppTheme.gray.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ItemTitleDescription(
            title: "Location",
            description: _touristPlace.location,
          ),
          ItemTitleDescription(
            title: "Coordinates",
            description:
                "${_touristPlace.latitude}, ${_touristPlace.longitude}",
          ),
          ItemTitleDescription(
            title: "History",
            description: _touristPlace.history,
          ),
          ItemTitleDescription(
            title: "Significance",
            description: _touristPlace.significance,
          ),
          ItemTitleDescription(
            title: "Cuisine",
            description: _touristPlace.cuisine,
          ),
          ItemTitleDescription(
            title: "Speciality",
            description: _touristPlace.specialty,
            spacing: false,
          ),
        ],
      ),
    );
  }
}
