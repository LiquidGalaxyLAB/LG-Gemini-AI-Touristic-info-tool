import 'package:flutter/material.dart';
import 'package:touristic/presentation/components/user_choice_card.dart';

import '../../../components/input_submit_button.dart';
import '../../../components/user_input_field.dart';

class ItineraryInputCard extends StatefulWidget {
  final Function _onContinueClick;

  const ItineraryInputCard({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<ItineraryInputCard> createState() => _ItineraryInputCardState();
}

class _ItineraryInputCardState extends State<ItineraryInputCard> {
  static const double _spacing = 12.0;
  final _destinationController = TextEditingController();
  final List<String> _budget = [
    "\$500",
    "\$1000",
    "\$2000",
    "\$3000",
    "\$5000+",
  ];
  final List<String> _duration = [
    "1-3 days", "4-7 days", "8-14 days", "15+ days"
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
                  hint: "India",
                  title: "Where do you want to travel?",
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _budget,
                  title: "What's your budget in USD(\$)?",
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _duration,
                  title: "How long you are planning to tour?",
                ),
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
