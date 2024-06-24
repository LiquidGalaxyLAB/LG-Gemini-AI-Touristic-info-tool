import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class UserChoiceCard extends StatefulWidget {
  final String _title;
  final List<String> _choices;
  final bool _singleSelection;
  final Function(List<int>)? _onSelectionChange;

  const UserChoiceCard({
    super.key,
    required List<String> choices,
    required String title,
    Function(List<int>)? onSelectionChange,
    bool singleSelection = true,
  })  : _title = title,
        _onSelectionChange = onSelectionChange,
        _choices = choices,
        _singleSelection = singleSelection;

  @override
  State<UserChoiceCard> createState() => _UserChoiceCardState();
}

class _UserChoiceCardState extends State<UserChoiceCard> {
  List<int> _selections = [0];

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget._title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade400,
          ),
        ),
        const SizedBox(height: 6.0),
        Wrap(
          spacing: 8,
          children: List.generate(widget._choices.length, (index) {
            final isSelected = _selections.contains(index);
            return ChoiceChip(
              showCheckmark: false,
              label: Text(
                widget._choices[index],
                style: TextStyle(
                    color: isSelected
                        ? AppTheme.gray.shade300
                        : AppTheme.gray.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: isSelected
                      ? AppTheme.color.shade700
                      : AppTheme.gray.shade900,
                ),
              ),
              selected: isSelected,
              selectedColor: AppTheme.color.shade700,
              backgroundColor: AppTheme.gray.shade900,
              onSelected: (value) {
                setState(() {
                  if (widget._singleSelection) {
                    _selections = value ? [index] : [];
                  } else {
                    if (value) {
                      _selections.add(index);
                    } else {
                      _selections.remove(index);
                    }
                  }
                });
                widget._onSelectionChange??(_selections);
              },
              elevation: 0,
            );
          }),
        ),
      ],
    );
  }
}
