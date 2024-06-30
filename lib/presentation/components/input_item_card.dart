import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart'; // Ensure you import your AppTheme here
import 'input_dialog.dart';

class InputItemCard extends StatefulWidget {
  final String title;
  final Function(List<String>)? onChoicesChanged;

  const InputItemCard({
    super.key,
    required this.title,
    this.onChoicesChanged,
  });

  @override
  State<InputItemCard> createState() => _InputItemCardState();
}

class _InputItemCardState extends State<InputItemCard> {
  final List<String> _choices = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade400,
          ),
        ),
        const SizedBox(height: 6.0),
        Wrap(
          spacing: 8,
          children: [
            ..._buildChoiceChips(),
            _buildAddButton(),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildChoiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _choices.length; i++) {
      chips.add(InputChip(
        label: Text(
          _choices[i],
          style: TextStyle(
            color: AppTheme.gray.shade400,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: AppTheme.gray.shade900,
          ),
        ),
        deleteIconColor: AppTheme.gray.shade400,
        elevation: 0,
        backgroundColor: AppTheme.gray.shade900,
        onDeleted: () {
          setState(() {
            _choices.removeAt(i);
            _notifyChoicesChanged();
          });
        },
      ));
    }
    return chips;
  }

  Widget _buildAddButton() {
    return ActionChip(
      onPressed: () {
        _showInputItemDialog();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: AppTheme.gray.shade900,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 0,
      backgroundColor: AppTheme.gray.shade900,
      label: Icon(
        Icons.add,
        color: AppTheme.gray.shade400,
        size: 24,
      ),
    );
  }

  Future<void> _showInputItemDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return InputDialog(
          title: "Add new tourist place",
          hint: "Taj Mahal, Agra",
          textInputType: TextInputType.text,
          onClick: (newChoice) {
            setState(() {
              _choices.add(newChoice);
              _textEditingController.clear();
              _notifyChoicesChanged();
              Navigator.of(context).pop(newChoice);
            });
          },
        );
      },
    );
  }

  void _notifyChoicesChanged() {
    widget.onChoicesChanged?.call(_choices);
  }
}
