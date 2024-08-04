import 'package:flutter/material.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../components/input_submit_button.dart';
import '../../../components/user_choice_card.dart';
import '../../../components/user_input_field.dart';

class CuisineInputCard extends StatefulWidget {
  final Function(Map<String, dynamic>) _onContinueClick;

  const CuisineInputCard({
    super.key,
    required Function(Map<String, dynamic>) onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<CuisineInputCard> createState() => _CuisineInputCardState();
}

class _CuisineInputCardState extends State<CuisineInputCard> {
  static const double _spacing = 12.0;

  final _destinationController = TextEditingController();

  final List<String> _preferences = [
    "Any",
    "Vegetarian",
    "Non-Vegetarian",
  ];

  final List<String> _restrictions = ["None", "Vegan", "Gluten-Free", "Dairy-Free", "Nut-Free", "Halal", "Kosher"];

  late String _selectedPreference;
  late String _selectedRestriction;

  @override
  void initState() {
    super.initState();
    _selectedPreference = _preferences[0];
    _selectedRestriction = _restrictions[0];
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
                  UserInputField(
                    controller: _destinationController,
                    inputType: TextInputType.text,
                    hint: "Agra, India",
                    title: "What's your target destination?",
                  ),
                  const SizedBox(height: _spacing),
                  UserChoiceCard(
                    title: "What's your preferred diet?",
                    choices: _preferences,
                    onSelectionChange: (values) {
                      _selectedPreference = _preferences[values[0]];
                    },
                  ),
                  const SizedBox(height: _spacing),
                  UserChoiceCard(
                    title: "Please select any dietary restrictions, If any?",
                    choices: _restrictions,
                    onSelectionChange: (values) {
                      _selectedRestriction = _restrictions[values[0]];
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
        "preference": _selectedPreference,
        "dietary-restriction": _selectedRestriction,
      });
    }
  }
}
