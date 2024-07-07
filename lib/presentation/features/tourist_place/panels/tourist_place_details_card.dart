import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../domain/model/tourist_place.dart';
import '../../../components/item_title_description.dart';

class TouristPlaceDetailsCard extends StatefulWidget {
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
                  setState(() {
                    isLiked = !isLiked;
                  });
                  widget._onIconClick(widget._touristPlace, isLiked);
                },
                icon: Icon(
                  isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 24,
                  color: isLiked
                      ? AppTheme.color.shade600
                      : AppTheme.gray.shade400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ItemTitleDescription(
            title: "Location",
            description: widget._touristPlace.location,
          ),
          ItemTitleDescription(
            title: "Coordinates",
            description:
                "${widget._touristPlace.latitude}, ${widget._touristPlace.longitude}",
          ),
          ItemTitleDescription(
            title: "History",
            description: widget._touristPlace.history,
          ),
          ItemTitleDescription(
            title: "Significance",
            description: widget._touristPlace.significance,
          ),
          ItemTitleDescription(
            title: "Cuisine",
            description: widget._touristPlace.cuisine,
          ),
          ItemTitleDescription(
            title: "Speciality",
            description: widget._touristPlace.specialty,
            spacing: false,
          ),
        ],
      ),
    );
  }
}
