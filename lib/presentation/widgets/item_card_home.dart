import 'package:flutter/material.dart';

class ItemCardHome extends StatelessWidget {
  final String assetName;
  final String title;
  final String description;

  const ItemCardHome({super.key, required this.assetName, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(),
        color: Colors.blue,
      child: Column(
        children: [
          Image(image: AssetImage(assetName)),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
