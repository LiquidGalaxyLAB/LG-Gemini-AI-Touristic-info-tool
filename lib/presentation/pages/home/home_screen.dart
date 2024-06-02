import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.chat_rounded),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.favorite_rounded),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Text(
          "asduas",
          style: TextStyle(fontSize: 48, color: Colors.black),
        ),
      ),
    );
  }
}
