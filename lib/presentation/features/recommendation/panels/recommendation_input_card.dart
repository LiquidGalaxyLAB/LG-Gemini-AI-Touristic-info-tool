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
  static const double _spacing = 12.0;

  final _destinationController = TextEditingController();
  final _scrollController = ScrollController();

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

  late String _selectedTravelStyle;

  @override
  void initState() {
    super.initState();
    _selectedTravelStyle = _style[0];
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
                    choices: _style,
                    title: "What is your travel style?",
                    singleSelection: false,
                    onSelectionChange: (values) {
                      _selectedTravelStyle = values.map((element) => _style[element]).toList().join(", ");
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
        "travel_style": _selectedTravelStyle,
      });
    }
  }
}
