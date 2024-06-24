import 'package:flutter/material.dart';
import '../../config/theme/app_theme.dart'; // Ensure you import your AppTheme here

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
        label: Text(_choices[i]),
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
    return GestureDetector(
      onTap: () {
        _showInputItemDialog();
      },
      child: Chip(
        backgroundColor: Colors.transparent,
        label: Icon(Icons.add, color: AppTheme.color.shade700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: AppTheme.color.shade700),
        ),
      ),
    );
  }

  Future<void> _showInputItemDialog() async {
    String? newChoice = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Choice'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter choice',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newChoice = _textEditingController.text.trim();
                if (newChoice.isNotEmpty) {
                  setState(() {
                    _choices.add(newChoice);
                    _textEditingController.clear();
                    _notifyChoicesChanged();
                    Navigator.of(context).pop(newChoice);
                  });
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _notifyChoicesChanged() {
    widget.onChoicesChanged?.call(_choices);
  }
}
