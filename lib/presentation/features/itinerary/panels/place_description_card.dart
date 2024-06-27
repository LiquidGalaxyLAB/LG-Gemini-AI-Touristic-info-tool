import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/utils/data_utils.dart';
import '../../../../domain/model/itinerary.dart';
import '../../../components/item_title_description.dart';

class PlaceDescriptionCard extends StatelessWidget {
  final Place _place;

  const PlaceDescriptionCard({
    super.key,
    required Place place,
  }) : _place = place;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _place.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.gray.shade300,
            ),
          ),
          const SizedBox(height: 12),
          ItemTitleDescription(
            title: "Location",
            description: _place.location,
          ),
          ItemTitleDescription(
            title: "Coordinates",
            description: "${_place.latitude}, ${_place.longitude}",
          ),
          ItemTitleDescription(
            title: "Description",
            description: _place.description,
          ),
          ItemTitleDescription(
            title: "Highlights",
            description: listToBulletPoints(_place.highlights),
            spacing: false,
          ),
        ],
      ),
    );
  }
}
