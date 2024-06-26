import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/utils/maps_utils.dart';
import '../../../domain/model/cuisine.dart';
import '../../components/layout_blueprint.dart';
import '../../components/response_item_card.dart';
import 'panels/cuisine_details_card.dart';
import 'panels/cuisine_input_card.dart';

const cuisines = [
  Cuisine(
    name: "Italian",
    aliases: ["Italian Cuisine", "Cucina Italiana"],
    description:
        "Italian cuisine is characterized by its simplicity, with many dishes having only two to four main ingredients.",
    origin: "Italy",
    duration: "1.5 min.",
    ingredients: [
      "Olive oil",
      "Tomatoes",
      "Garlic",
      "Basil",
      "Pasta",
      "Cheese",
    ],
    recipe: [
      "Boil pasta according to package instructions.",
      "Heat olive oil in a pan and sauté garlic.",
      "Add tomatoes and cook until soft.",
      "Mix in cooked pasta and top with basil and cheese."
    ],
  ),
  Cuisine(
    name: "Japanese",
    aliases: ["Japanese Cuisine", "Washoku"],
    description:
        "Japanese cuisine is based on combining staple foods, typically rice or noodles, with a soup and okazu (dishes made from fish, meat, vegetable, tofu and the like) to add flavor to the staple food.",
    origin: "Japan",
    duration: "1.0 min.",
    ingredients: [
      "Rice",
      "Soy sauce",
      "Fish",
      "Seaweed",
      "Tofu",
      "Ginger",
    ],
    recipe: [
      "Cook rice as per instructions.",
      "Prepare sushi by slicing fish and vegetables.",
      "Roll ingredients in seaweed with rice.",
      "Serve with soy sauce and pickled ginger."
    ],
  ),
  Cuisine(
    name: "Mexican",
    aliases: ["Mexican Cuisine", "Cocina Mexicana"],
    description:
        "Mexican cuisine is known for its varied flavors, colorful decoration, and variety of spices and ingredients.",
    origin: "Mexico",
    duration: "2.0 min.",
    ingredients: [
      "Tortillas",
      "Beans",
      "Chili peppers",
      "Tomatoes",
      "Avocado",
      "Cilantro",
    ],
    recipe: [
      "Prepare tortillas by heating them on a skillet.",
      "Cook beans with spices until tender.",
      "Make salsa with chopped tomatoes, chili peppers, and cilantro.",
      "Serve tortillas with beans, salsa, and sliced avocado."
    ],
  ),
];

class CuisinePage extends StatefulWidget {
  const CuisinePage({super.key});

  @override
  State<CuisinePage> createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBlueprint(
      cameraPosition: const CameraPosition(
        target: LatLng(
          12.0,
          412.2,
        ),
        zoom: 7,
      ),
      controller: _controller,
      panelLeft: CuisineInputCard(
        onContinueClick: () {},
      ),
      panelDividedLeft: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ResponseItemCard(
                title: cuisines[index].name,
                description: cuisines[index].description,
                label: cuisines[index].duration,
                selected: _selected == index,
                onTap: () {
                  setState(() {
                    _selected = index;
                  });
                  moveToPlace(_controller, const LatLng(21, 214));
                },
              ),
              if (index < cuisines.length - 1) const SizedBox(height: 8)
            ],
          );
        },
      ),
      panelRight: CuisineDetailsCard(
        cuisine: cuisines[_selected],
      ),
    );
  }
}
