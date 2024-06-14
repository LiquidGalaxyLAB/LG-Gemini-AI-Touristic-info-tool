import 'package:flutter/material.dart';

import '../../domain/model/cuisine.dart';

class CuisineResultPanel extends StatelessWidget {
  final Cuisine cuisine;

  const CuisineResultPanel({Key? key, required this.cuisine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cuisine.name,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Also known as: ${cuisine.aliases.join(', ')}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              cuisine.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Origin',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              cuisine.origin,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Preparation Duration: ${cuisine.duration.toStringAsFixed(1)} hours',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...cuisine.ingredients.map((ingredient) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- $ingredient',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
            SizedBox(height: 16.0),
            Text(
              'Recipe',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...cuisine.recipe.map((step) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- $step',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
          ],
        ),
      ),
    );
  }
}