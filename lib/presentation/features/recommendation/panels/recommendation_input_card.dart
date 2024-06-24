import 'package:flutter/material.dart';
import 'package:touristic/presentation/components/input_submit_button.dart';
import 'package:touristic/presentation/components/user_choice_card.dart';
import 'package:touristic/presentation/components/user_input_field.dart';

class RecommendationInputCard extends StatefulWidget {
  final Function _onContinueClick;

  const RecommendationInputCard({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<RecommendationInputCard> createState() => _RecommendationInputCardState();
}

class _RecommendationInputCardState extends State<RecommendationInputCard> {
  static const double spacing = 12.0;

  final destinationController = TextEditingController();

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
                  controller: destinationController,
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
        InputSubmitButton(onContinueClick: widget._onContinueClick),
      ],
    );
  }
}
