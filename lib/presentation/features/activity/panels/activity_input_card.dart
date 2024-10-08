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
  final _scrollController = ScrollController();
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
          child: Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.only(right: 24.0),
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
        ),
        const SizedBox(height: _spacing),
        InputSubmitButton(onContinueClick: _onSubmitClick),
      ],
    );
  }

  Future<void> _onSubmitClick() async {
    if (_destinationController.text.isEmpty) {
      await showInvalidInputDialog(context);
    } else {
      await widget._onContinueClick({
        "destination": _destinationController.text,
        "budget": _selectedBudget,
        "duration": _selectedDuration,
      });
    }
  }
}
