import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class ItineraryInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const ItineraryInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
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
  final List<String> _duration = ["1-3 days", "4-7 days", "8-14 days", "15+ days"];

  late String _selectedBudget;
  late String _selectedDuration;

  @override
  void initState() {
    super.initState();
    _selectedBudget = _budget[0];
    _selectedDuration = _duration[0];
  }

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
                  onSelectionChange: (values) {
                    _selectedBudget = _budget[values[0]];
                  },
                ),
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _duration,
                  title: "How long you are planning to tour?",
                  onSelectionChange: (values) {
                    _selectedDuration = _duration[values[0]];
                  },
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
            widget._onContinueClick({
              "destination": _destinationController.text,
              "budget": _selectedBudget,
              "duration": _selectedDuration,
            });
          }
        }),
      ],
    );
  }
}
