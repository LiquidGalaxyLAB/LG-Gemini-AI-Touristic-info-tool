import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_item_card.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';

class BudgetInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const BudgetInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<BudgetInputCard> createState() => _BudgetInputCardState();
}

class _BudgetInputCardState extends State<BudgetInputCard> {
  static const double _spacing = 12.0;

  final List<String> _budget = [
    "\$500",
    "\$1000",
    "\$2000",
    "\$3000",
    "\$5000+",
  ];
  final List<String> _duration = ["1-3 days", "4-7 days", "8-14 days", "15+ days"];

  final List<String> _travellers = ["Solo", "Couple", "3-5", "6-10", "10+"];

  List<String> _choices = [];

  late String _selectedBudget;
  late String _selectedDuration;
  late String _selectedCompanions;

  @override
  void initState() {
    super.initState();
    _selectedBudget = _budget[0];
    _selectedDuration = _duration[0];
    _selectedCompanions = _travellers[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              primary: true,
              padding: const EdgeInsets.only(right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputItemCard(
                    title: "What are the places you are planing to visit?",
                    onChoicesChanged: (choices) {
                      _choices = choices;
                    },
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
                  const SizedBox(height: _spacing),
                  UserChoiceCard(
                    choices: _travellers,
                    title: "How many people are travelling with you?",
                    onSelectionChange: (values) {
                      _selectedCompanions = _travellers[values[0]];
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: _spacing),
        InputSubmitButton(onContinueClick: () {
          if (_choices.isEmpty) {
            showInvalidInputDialog(context);
          } else {
            widget._onContinueClick({
              "itinerary": _choices
                  .map((ele) => ele
                      .replaceAll(',', ' ')
                      .replaceAll(
                        "  ",
                        " ",
                      )
                      .trim())
                  .join(", "),
              "budget": _selectedBudget,
              "duration": _selectedDuration,
              "companions": _selectedCompanions,
            });
          }
        }),
      ],
    );
  }
}
