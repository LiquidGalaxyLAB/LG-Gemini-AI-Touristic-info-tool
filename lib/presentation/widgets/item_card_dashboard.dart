import 'package:flutter/material.dart';

class ItemCardDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;

  const ItemCardDashboard({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                iconData,
              ),
            ),
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}
