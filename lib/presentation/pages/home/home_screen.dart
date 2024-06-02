import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:touristic/presentation/widgets/item_card_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var color = Colors.redAccent;
  var as = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.chat_rounded),
            onPressed: () {
              setState(() {
                color = Colors.blueAccent;
              });
            },
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.favorite_rounded),
            onPressed: () {
              setState(() {
                color = Colors.amberAccent;
              });
            },
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.settings_rounded),
            onPressed: () {
              setState(() {
                color = Colors.redAccent;
              });
            },
          ),
        ],
      ),
          // assetName: "assets/images/placeholder.png",
          // title: "as hafs sau asf hafu",
          // description: "as hasfiu asf uiasfai sf",
      body: Container(
        child: Row (
          children: [
            if (as)
            Flexible(
              flex: 2,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return new ItemCardHome(
                    assetName: "assets/images/placeholder.png",
                    title: "as hafs sau asf hafu",
                    description: "as hasfiu asf uiasfai sf",
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: color,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      as = !as;

                    });{
                    }
                  }, child: Text("sadusda"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
