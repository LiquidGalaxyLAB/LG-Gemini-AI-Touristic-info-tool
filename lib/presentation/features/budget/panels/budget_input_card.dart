import 'package:flutter/material.dart';

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
                const InputItemCard(
                  title: "What are the places you are planing to visit?",
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
                const SizedBox(height: _spacing),
                UserChoiceCard(
                  choices: _travellers,
                  title: "How many people are travelling with you?",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: _spacing / 2),
        InputSubmitButton(onContinueClick: () {
          widget._onContinueClick({});
        }),
      ],
    );
  }
}
