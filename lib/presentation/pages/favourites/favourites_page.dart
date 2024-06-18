import 'package:flutter/material.dart';
import 'package:touristic/config/theme/app_theme.dart';
import 'package:touristic/domain/model/tourist_place.dart';
import 'package:touristic/presentation/panel/maps_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  var _selected = 0;
  List<TouristPlace> favourites = [];
  static const double spacing = 12.0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      favourites.add(TouristPlace(
        name: "Beautiful Place$i",
        location: "Haryana",
        latitude: 12.9716,
        longitude: 77.5946,
        history: "This place has a rich history...",
        significance: "It is significant because...",
        cuisine: "Famous for its delicious cuisine...",
        specialty: "Known for its unique specialty...",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray.shade900,
      padding: const EdgeInsets.all(spacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: _buildFavouriteList(favourites),
          ),
          const SizedBox(width: spacing),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                const Flexible(
                  flex: 4,
                  child: MapsCard(),
                ),
                const SizedBox(height: spacing),
                Flexible(
                  flex: 5,
                  child: _buildFavouriteDetailsCard(
                    favourites[_selected],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFavouriteList(
    List<TouristPlace> favourites,
  ) {
    return Container(
      padding: const EdgeInsets.all(spacing),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.gray.shade800,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: favourites.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _buildFavouriteCard(
                  favourites[index],
                  _selected == index,
                  () {
                    setState(() {
                      _selected = index;
                    });
                  },
                ),
                if (index < favourites.length - 1) const SizedBox(height: 8)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFavouriteCard(
    TouristPlace place,
    bool selected,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? AppTheme.color.shade700 : AppTheme.gray.shade900,
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
                  place.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: selected ? AppTheme.gray.shade200 : AppTheme.gray.shade400,
                  ),
                ),
                Text(
                  "(${place.latitude}, ${place.longitude})",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: selected ? AppTheme.gray.shade300 : AppTheme.gray.shade600,
                  ),
                ),
              ],
            ),
            Text(
              place.specialty,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: selected ? AppTheme.gray.shade200 : AppTheme.gray.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouriteDetailsCard(
    TouristPlace touristPlace,
  ) {
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
              touristPlace.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppTheme.gray.shade300,
              ),
            ),
            const SizedBox(height: 10),
            _buildTitleDescriptionItem(
              title: "Location",
              description: touristPlace.location,
            ),
            _buildTitleDescriptionItem(
              title: "Coordinates",
              description:
                  "${touristPlace.latitude}, ${touristPlace.longitude}",
            ),
            _buildTitleDescriptionItem(
              title: "History",
              description: touristPlace.history,
            ),
            _buildTitleDescriptionItem(
              title: "Significance",
              description: touristPlace.significance,
            ),
            _buildTitleDescriptionItem(
              title: "Cuisine",
              description: touristPlace.cuisine,
            ),
            _buildTitleDescriptionItem(
                title: "Speciality",
                description: touristPlace.specialty,
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
