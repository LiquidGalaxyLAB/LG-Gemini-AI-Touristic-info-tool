import 'package:flutter/material.dart';
import 'package:touristic/presentation/widgets/maps_widget.dart';

class ContentMainPage extends StatefulWidget {
  const ContentMainPage({super.key});

  @override
  State<ContentMainPage> createState() => _ContentMainPageState();
}

class _ContentMainPageState extends State<ContentMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 60,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Flexible(
            flex: 40,
            child: Column(
              children: [
                Expanded(child: MapsWidget()),
                Expanded(child: Container(
                  color: Colors.orange,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
