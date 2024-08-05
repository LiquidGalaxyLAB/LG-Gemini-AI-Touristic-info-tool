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
  final _scrollController = ScrollController();

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

  late String _selectedBudget;
  late String _selectedInterests;

  @override
  void initState() {
    super.initState();
    _selectedBudget = _budget[0];
    _selectedInterests = _interests[0];
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
                    hint: "Haryana, India",
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
                    choices: _interests,
                    title: "What environment interests you most?",
                    singleSelection: false,
                    onSelectionChange: (List<int> values) {
                      _selectedInterests = values.map((element) => _interests[element]).toList().join(", ");
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
        "interests": _selectedInterests,
      });
    }
  }
}
