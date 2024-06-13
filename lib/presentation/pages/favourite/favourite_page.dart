import 'package:flutter/material.dart';
import 'package:touristic/presentation/widgets/maps_widget.dart';

import '../../../domain/model/tourist_place.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
              flex: 6, child: FavoritePage(place: TouristPlace(
            name: "Beautiful Place",
            latitude: 12.9716,
            longitude: 77.5946,
            history: "This place has a rich history...",
            significance: "It is significant because...",
            cuisine: "Famous for its delicious cuisine...",
            specialty: "Known for its unique specialty...",
          ),)
          ),

          Flexible(
              flex: 5,
              child: MapsWidget()
          ),
        ],
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  final TouristPlace place;

  const FavoritePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Tourist Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: TouristPlaceDetails(place: place),
      ),
    );
  }
}

// Define the TouristPlaceDetails widget
class TouristPlaceDetails extends StatelessWidget {
  final TouristPlace place;

  const TouristPlaceDetails({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Place name
        Text(
          place.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),

        // Coordinates
        Text(
          'Coordinates: (${place.latitude}, ${place.longitude})',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),

        // History
        Text(
          'History',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          place.history,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),

        // Significance
        Text(
          'Significance',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          place.significance,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),

        // Cuisine
        Text(
          'Cuisine',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          place.cuisine,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 16.0),

        // Specialty
        Text(
          'Specialty',
          style: TextStyle(
            fontSize: 22.0,
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
    );
  }
}