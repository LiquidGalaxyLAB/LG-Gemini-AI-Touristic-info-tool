import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class TouristPlaceInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const TouristPlaceInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<TouristPlaceInputCard> createState() => _TouristPlaceInputCardState();
}

class _TouristPlaceInputCardState extends State<TouristPlaceInputCard> {
  static const double _spacing = 12.0;
  final _destinationController = TextEditingController();

  final List<String> _budget = [
    "\$500",
    "\$1000",
    "\$2000",
    "\$3000",
    "\$5000+",
  ];

  final List<String> _interests = [
    "Mountains",
    "Beaches",
    "Forests",
    "Urban",
    "Countryside",
    "Deserts",
    "Lakes and Rivers",
    "Islands",
    "Coastal",
    "Plains",
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
                  hint: "Haryana, India",
                  title: "Where do you want to travel?",
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _budget,
                  title: "What's your budget in USD(\$)?",
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _interests,
                  onSelectionChange: (List<int> values) {},
                  title: "What environment interests you most?",
                  singleSelection: false,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: _spacing / 2),
        InputSubmitButton(onContinueClick: () {
          if (_destinationController.text.isEmpty) {
            showInvalidInputDialog(context);
          } else {
            widget._onContinueClick({});
          }
        }),
      ],
    );
  }
}
