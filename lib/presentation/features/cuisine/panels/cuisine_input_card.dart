import 'package:flutter/material.dart';

import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class CuisineInputCard extends StatefulWidget {
  final Function _onContinueClick;

  const CuisineInputCard({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<CuisineInputCard> createState() => _CuisineInputCardState();
}

class _CuisineInputCardState extends State<CuisineInputCard> {
  static const double _spacing = 12.0;

  final _destinationController = TextEditingController();

  final List<String> _preferences = [
    "Any",
    "Vegetarian",
    "Non-Vegetarian",
  ];

  final List<String> _restrictions = [
    "None",
    "Vegan",
    "Gluten-Free",
    "Dairy-Free",
    "Nut-Free",
    "Halal",
    "Kosher"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInputField(
                  controller: _destinationController,
                  inputType: TextInputType.text,
                  hint: "Agra, India",
                  title: "What's your target destination?",
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  title: "What's your preferred diet?",
                  choices: _preferences,
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                    title: "Please select any dietary restrictions, If any?",
                    choices: _restrictions),
              ],
            ),
          ),
        ),
        const SizedBox(height: _spacing / 2),
        InputSubmitButton(onContinueClick: widget._onContinueClick),
      ],
    );
  }
}
