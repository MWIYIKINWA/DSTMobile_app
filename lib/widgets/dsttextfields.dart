import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  const MyTextBox(
      {super.key,
      required this.hint,
      this.obscureText = false,
      this.controller,
      this.icon,
      this.keyboardType = TextInputType.text});

  final String hint;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          labelStyle: const TextStyle(fontSize: 16, fontFamily: "Poppins"),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
      ),
    );
  }
}
