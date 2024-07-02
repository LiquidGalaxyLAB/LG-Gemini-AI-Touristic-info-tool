import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class ActivityInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const ActivityInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<ActivityInputCard> createState() => _ActivityInputCardState();
}

class _ActivityInputCardState extends State<ActivityInputCard> {
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
