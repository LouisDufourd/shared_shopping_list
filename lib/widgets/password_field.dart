import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final InputBorder border;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  const PasswordField({
    super.key,
    this.border = const OutlineInputBorder(),
    required this.labelText,
    required this.validator,
    required this.controller,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: widget.border,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: _obscureText ? Colors.red : Colors.black54,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      obscureText: _obscureText, // Hide the text by default
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
