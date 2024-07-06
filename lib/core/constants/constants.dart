import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/color/app_color.dart';
import '../../config/theme/color/impl/blue_color.dart';
import '../../config/theme/color/impl/green_color.dart';
import '../../config/theme/color/impl/indigo_color.dart';
import '../../config/theme/color/impl/pink_color.dart';
import '../../config/theme/color/impl/purple_color.dart';
import '../../config/theme/color/impl/red_color.dart';
import '../../config/theme/color/impl/yellow_color.dart';
import '../../config/theme/maps_theme.dart';

const String geminiFlashLatest = "gemini-1.5-flash-latest";

const String touristPlacesTable = "tourist_places";
const String appDatabase = "app_database.db";

const Map<String, IconData> dashboardItems = {
  "Chat": Icons.chat_rounded,
  "Tourist Place": Icons.tour_rounded,
  "Budget Plan": Icons.attach_money_rounded,
  "Activity": Icons.skateboarding_rounded,
  "Recommendation": Icons.star_rounded,
  "Local Cuisine": Icons.emoji_food_beverage_rounded,
  "Itinerary": Icons.location_on_rounded,
  "Favourites": Icons.favorite_rounded,
  "Settings": Icons.settings_rounded,
  "About": Icons.info_rounded,
};

List<AppColor> appThemes = [
  RedColor(),
  YellowColor(),
  GreenColor(),
  BlueColor(),
  IndigoColor(),
  PurpleColor(),
  PinkColor(),
];

const Map<String, MapType> mapsStylesMap = {
  "assets/maps/style/normal.png": MapType.normal,
  "assets/maps/style/terrain.png": MapType.terrain,
  "assets/maps/style/satellite.png": MapType.satellite,
  "assets/maps/style/hybrid.png": MapType.hybrid,
};

const Map<String, String> mapsThemesMap = {
  "assets/maps/theme/none.png": mapsThemeNone,
  "assets/maps/theme/red.png": mapsThemeRed,
  "assets/maps/theme/yellow.png": mapsThemeYellow,
  "assets/maps/theme/green.png": mapsThemeGreen,
  "assets/maps/theme/blue.png": mapsThemeBlue,
  "assets/maps/theme/indigo.png": mapsThemeIndigo,
  "assets/maps/theme/purple.png": mapsThemePurple,
  "assets/maps/theme/pink.png": mapsThemePink,
};
