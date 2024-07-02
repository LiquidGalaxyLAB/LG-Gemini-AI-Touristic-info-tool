import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class RecommendationInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const RecommendationInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<RecommendationInputCard> createState() => _RecommendationInputCardState();
}

class _RecommendationInputCardState extends State<RecommendationInputCard> {
  static const double spacing = 12.0;

  final _destinationController = TextEditingController();

  final List<String> _style = [
    "Adventure",
    "Family-Friendly",
    "Relaxation",
    "Cultural",
    "Road Trips",
    "Community Service",
    "Solo Travel",
    "Eco-Friendly",
    "Historical",
    "Food and Culinary",
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
                const SizedBox(height: spacing),
                UserChoiceCard(
                  choices: _style,
                  onSelectionChange: (List<int> values) {},
                  title: "What is your travel style?",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: spacing / 2),
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
