import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import 'confirmation_dialog.dart';

class LGButton extends StatefulWidget {
  final String _label;
  final IconData _icon;
  final Function() _onPressed;
  final bool _enabled;
  final bool _styleSmall;
  final bool _twoSteps;

  const LGButton({
    required String label,
    required IconData icon,
    required dynamic Function() onPressed,
    required bool enabled,
    bool styleSmall = false,
    bool twoSteps = false,
    super.key,
  })  : _twoSteps = twoSteps,
        _styleSmall = styleSmall,
        _enabled = enabled,
        _onPressed = onPressed,
        _icon = icon,
        _label = label;

  @override
  State<LGButton> createState() => _LGButtonState();
}

class _LGButtonState extends State<LGButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget._styleSmall ? 170 : 350,
      height: 55,
      child: FilledButton(
        onPressed: () async {
          if (widget._twoSteps) {
            _showConfirmationDialog(context);
          } else {
            if (widget._enabled && !_loading) {
              setState(() {
                _loading = true;
              });
              await widget._onPressed();
              setState(() {
                _loading = false;
              });
            }
          }
        },
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppTheme.gray.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget._label,
              style: TextStyle(
                color: AppTheme.gray.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            _loading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppTheme.color.shade600,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 3,
                    ),
                  )
                : Icon(
                    widget._icon,
                    color: AppTheme.gray.shade300,
                    size: 24,
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
            onClick: (res ) async {
              if (res) {
                if (widget._enabled && !_loading) {
                  setState(() {
                    _loading = true;
                  });
                  await widget._onPressed();
                  setState(() {
                    _loading = false;
                  });
                }
              }
            },
            prompt: "Are you sure you want to perform '${widget._label}'?",
          );
        },
      );
    }
  }

}
