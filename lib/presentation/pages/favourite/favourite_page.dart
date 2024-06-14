import 'package:flutter/material.dart';
import 'package:touristic/presentation/panel/maps_panel.dart';
import '../../../domain/model/tourist_place.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  // List of favorite tourist places
  final List<TouristPlace> favoritePlaces = [
    TouristPlace(
      name: "Beautiful Place",
      location: "",
      latitude: 12.9716,
      longitude: 77.5946,
      history: "This place has a rich history...",
      significance: "It is significant because...",
      cuisine: "Famous for its delicious cuisine...",
      specialty: "Known for its unique specialty...",
    ),
    TouristPlace(
      name: "Beautiful Place",
      latitude: 12.9716,
      location: "",
      longitude: 77.5946,
      history: "This place has a rich history...",
      significance: "It is significant because...",
      cuisine: "Famous for its delicious cuisine...",
      specialty: "Known for its unique specialty...",
    ),
    TouristPlace(
      name: "Beautiful Place",
      latitude: 12.9716,
      location: "",
      longitude: 77.5946,
      history: "This place has a rich history...",
      significance: "It is significant because...",
      cuisine: "Famous for its delicious cuisine...",
      specialty: "Known for its unique specialty...",
    ),
    TouristPlace(
      location: "",
      name: "Beautiful Place",
      latitude: 12.9716,
      longitude: 77.5946,
      history: "This place has a rich history...",
      significance: "It is significant because...",
      cuisine: "Famous for its delicious cuisine...",
      specialty: "Known for its unique specialty...",
    ),
    // Add more places here
  ];

  // Set to keep track of expanded items
  final Set<int> expandedItems = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: ListView.builder(
              itemCount: favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = favoritePlaces[index];
                final isExpanded = expandedItems.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isExpanded) {
                        expandedItems.remove(index);
                      } else {
                        expandedItems.clear(); // Ensure only one item is expanded at a time
                        expandedItems.add(index);
                      }
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            place.history,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          if (isExpanded) ...[
                            SizedBox(height: 8.0),
                            Text(
                              'Coordinates: (${place.latitude}, ${place.longitude})',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Significance',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              place.significance,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Cuisine',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              place.cuisine,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Specialty',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              place.specialty,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
            flex: 5,
            child: MapsPanel(),
          ),
        ],
      ),
    );
  }
}
