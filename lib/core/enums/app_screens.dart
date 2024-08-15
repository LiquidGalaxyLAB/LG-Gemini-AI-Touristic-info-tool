enum AppScreens {
  place("/"),
  budget("/budget_plan"),
  activity("/activity"),
  cuisine("/cuisine"),
  itinerary("/itinerary"),
  favourites("/favourites"),
  chat("/chat"),
  settings("/settings"),
  about("/about");

  final String route;
  const AppScreens(this.route);
}