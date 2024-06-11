enum Screens {
  chat("/"),
  place("/tourist_place"),
  budget("/budget_plan"),
  activity("/activity"),
  cuisine("/cuisine"),
  itinerary("/itinerary"),
  favourite("/favourite"),
  settings("/settings"),
  about("/about");

  final String route;
  const Screens(this.route);
}