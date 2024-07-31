import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController _controller;
  final bool obscureText;
  const CustomField({
    super.key,
    required this.hintText,
    required TextEditingController controller,
    this.obscureText = false,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
