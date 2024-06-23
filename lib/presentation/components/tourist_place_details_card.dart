import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';
import '../../domain/model/tourist_place.dart';

class TouristPlaceDetailsCard extends StatefulWidget {
  final TouristPlace _touristPlace;
  final bool _liked;
  final Function _onIconClick;

  const TouristPlaceDetailsCard({
    super.key,
    required TouristPlace touristPlace,
    required bool liked,
    required Function onIconClick,
  })  : _onIconClick = onIconClick,
        _liked = liked,
        _touristPlace = touristPlace;

  @override
  State<TouristPlaceDetailsCard> createState() =>
      _TouristPlaceDetailsCardState();
}

class _TouristPlaceDetailsCardState extends State<TouristPlaceDetailsCard> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget._liked;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._touristPlace.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.gray.shade300,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget._onIconClick();
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 24,
                  color:
                  isLiked ? AppTheme.color.shade600 : AppTheme.gray.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTitleDescriptionItem(
            title: "Location",
            description: widget._touristPlace.location,
          ),
          _buildTitleDescriptionItem(
            title: "Coordinates",
            description:
                "${widget._touristPlace.latitude}, ${widget._touristPlace.longitude}",
          ),
          _buildTitleDescriptionItem(
            title: "History",
            description: widget._touristPlace.history,
          ),
          _buildTitleDescriptionItem(
            title: "Significance",
            description: widget._touristPlace.significance,
          ),
          _buildTitleDescriptionItem(
            title: "Cuisine",
            description: widget._touristPlace.cuisine,
          ),
          _buildTitleDescriptionItem(
              title: "Speciality",
              description: widget._touristPlace.specialty,
              spacing: false),
        ],
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
