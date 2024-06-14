import 'package:flutter/material.dart';

import '../../domain/model/recommendation.dart';

class RecommendationResultPanel extends StatelessWidget {
  final Recommendation recommendation;

  const RecommendationResultPanel({Key? key, required this.recommendation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recommendation.name,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              recommendation.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Cost: \$${recommendation.cost.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Duration: ${recommendation.duration.toStringAsFixed(1)} hours',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Highlights',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            ...recommendation.highlights.map((highlight) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '- $highlight',
                style: TextStyle(fontSize: 16.0),
              ),
            )),
          ],
        ),
      ),
    );
  }
}