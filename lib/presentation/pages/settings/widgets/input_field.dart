import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType type;
  final IconData prefixIcon;
  final List<IconData>? suffixIcons;

  const InputField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.type,
    required this.prefixIcon,
    this.suffixIcons,
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscure = false;
  bool _isPassword = false;
  int _suffixIndex = 0;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.type == TextInputType.visiblePassword) {
      _obscure = true;
      _isPassword = true;
    }

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor =
        _focusNode.hasFocus ? AppTheme.gray.shade400 : AppTheme.gray.shade700;

    return SizedBox(
      width: 350,
      height: 60,
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        keyboardType: widget.type,
        obscureText: _obscure,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppTheme.gray.shade400,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: TextStyle(
            color: AppTheme.gray.shade700,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            color: AppTheme.gray.shade700,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              widget.prefixIcon,
              size: 20,
              color: iconColor,
            ),
          ),
          focusColor: AppTheme.color.shade700,
          suffixIcon: _isPassword
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _suffixIndex = (_suffixIndex + 1) % 2;
                        _obscure = !_obscure;
                      });
                    },
                    icon: Icon(
                      widget.suffixIcons!.elementAt(_suffixIndex),
                      size: 20,
                      color: iconColor,
                    ),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.color.shade700, width: 1.3),
          ),
          floatingLabelStyle: TextStyle(
            color: AppTheme.gray.shade400,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
