import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class UserInputCard extends StatefulWidget {
  final Function _onContinueClick;

  const UserInputCard({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<UserInputCard> createState() => _UserInputCardState();
}

class _UserInputCardState extends State<UserInputCard> {
  static const double spacing = 12.0;

  final destinationController = TextEditingController();
  final budgetController = TextEditingController();

  int interest = 0;
  int activity = 0;
  List<String> _choicesList = ['All', 'Pending', 'Accepted'];

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
                _buildTitle("Where do you want to travel?"),
                const SizedBox(height: spacing / 2),
                _buildInputField(
                  "Haryana, India",
                  TextInputType.text,
                  destinationController,
                ),
                const SizedBox(height: spacing),
                _buildTitle("What's your budget in USD(\$)?"),
                const SizedBox(height: spacing / 2),
                _buildInputField(
                  "200",
                  TextInputType.number,
                  budgetController,
                ),
                const SizedBox(height: spacing),
                _buildTitle("What kind of activities you like?"),
                const SizedBox(height: spacing / 2),
                _buildChoices(
                  _choicesList,
                  activity,
                  (int value) {
                    setState(() {
                      activity = value;
                    });
                  },
                ),
                const SizedBox(height: spacing),
                _buildTitle("What interests you most?"),
                const SizedBox(height: spacing / 2),
                _buildChoices(
                  _choicesList,
                  interest,
                  (int value) {
                    setState(() {
                      interest = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: spacing / 2),
        Align(
          alignment: Alignment.bottomRight,
          child: FilledButton(
            onPressed: () {
              widget._onContinueClick();
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppTheme.color.shade700,
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                color: AppTheme.gray.shade200,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInputField(
    String hint,
    TextInputType type,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.gray.shade900,
      ),
      child: TextField(
        controller: controller,
        keyboardType: type,
        enableSuggestions: false,
        cursorColor: AppTheme.color.shade700,
        autocorrect: false,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppTheme.gray.shade400,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          hintStyle: TextStyle(
            color: AppTheme.gray.shade700,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
          ),
        ),
      ),
    );
  }

  Widget _buildChoices(
    List<String> choices,
    int selected,
    Function onClick,
  ) {
    return Wrap(
      spacing: 8,
      children: List.generate(choices.length, (index) {
        return ChoiceChip(
          showCheckmark: false,
          label: Text(
            choices[index],
            style: TextStyle(
                color: selected == index
                    ? AppTheme.gray.shade300
                    : AppTheme.gray.shade400,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: selected == index
                  ? AppTheme.color.shade700
                  : AppTheme.gray.shade900,
            ),
          ),
          selected: selected == index,
          selectedColor: AppTheme.color.shade700,
          backgroundColor: AppTheme.gray.shade900,
          onSelected: (value) {
            if (value) {
              onClick(index);
            }
          },
          elevation: 0,
        );
      }),
    );
  }

  Widget _buildTitle(String data) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.gray.shade400,
      ),
    );
  }
}
