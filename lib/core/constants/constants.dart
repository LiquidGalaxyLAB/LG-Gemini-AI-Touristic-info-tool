import 'package:flutter/material.dart';
import 'package:touristic/config/theme/color/app_color.dart';
import 'package:touristic/config/theme/color/impl/red_color.dart';

import '../../config/theme/color/impl/blue_color.dart';
import '../../config/theme/color/impl/green_color.dart';
import '../../config/theme/color/impl/indigo_color.dart';
import '../../config/theme/color/impl/pink_color.dart';
import '../../config/theme/color/impl/purple_color.dart';
import '../../config/theme/color/impl/yellow_color.dart';
import '../../config/theme/maps_theme.dart';

const String geminiBaseUrl = "";
const String openAiBaseUrl = "";

const String geminiFlashLatest = "gemini-1.5-flash-latest";
const String geminiApiKey = "gemini-1.5-flash-latest";

const String touristPlacesTable = "tourist_places";
const String appDatabase = "app_database.db";

const Map<String, IconData> dashboardItems = {
  "Chat": Icons.chat_rounded,
  "Tourist PLace": Icons.tour_rounded,
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
  RedColor(), YellowColor(), GreenColor(), BlueColor(), IndigoColor(), PurpleColor(), PinkColor(),
];

List<String> mapsStyles = [];

const Map<String, String> mapsThemesMap = {
  "assets/maps/none.png": mapsThemeNone,
  "assets/maps/blue.png": mapsThemeBlue,
  "assets/maps/pink.png": mapsThemePink,
  "assets/maps/indigo.png": mapsThemeIndigo,
  "assets/maps/red.png": mapsThemeRed,
  "assets/maps/green.png": mapsThemeGreen,
  "assets/maps/purple.png": mapsThemePurple,
  "assets/maps/yellow.png": mapsThemeYellow,
};