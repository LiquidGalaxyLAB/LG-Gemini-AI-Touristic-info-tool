import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/tourist_place.dart';

class FavouriteDetailsCard extends StatelessWidget {
  static const double spacing = 12.0;
  final TouristPlace _touristPlace;

  const FavouriteDetailsCard({
    super.key,
    required TouristPlace touristPlace,
  }) : _touristPlace = touristPlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.gray.shade800,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _touristPlace.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade300,
              ),
            ),
            const SizedBox(height: 10),
            _buildTitleDescriptionItem(
              title: "Location",
              description: _touristPlace.location,
            ),
            _buildTitleDescriptionItem(
              title: "Coordinates",
              description:
                  "${_touristPlace.latitude}, ${_touristPlace.longitude}",
            ),
            _buildTitleDescriptionItem(
              title: "History",
              description: _touristPlace.history,
            ),
            _buildTitleDescriptionItem(
              title: "Significance",
              description: _touristPlace.significance,
            ),
            _buildTitleDescriptionItem(
              title: "Cuisine",
              description: _touristPlace.cuisine,
            ),
            _buildTitleDescriptionItem(
                title: "Speciality",
                description: _touristPlace.specialty,
                spacing: false),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleDescriptionItem({
    required String title,
    required String description,
    bool spacing = true,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade400,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppTheme.gray.shade300,
          ),
        ),
        if (spacing) const SizedBox(height: 10)
      ],
    );
  }
}
