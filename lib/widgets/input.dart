import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: isPassword,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
