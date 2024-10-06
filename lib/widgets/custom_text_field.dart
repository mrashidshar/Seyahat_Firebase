import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the field
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          obscureText: false, // Set to true for password field behavior
          decoration: InputDecoration(
            labelText: hintText, // Label for the text field
            labelStyle: TextStyle(color: Colors.blue[800]), // Customize label color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
              borderSide: BorderSide(color: Colors.grey.shade300), // Light gray border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFF1A76D2)), // Focused border color
            ),
            filled: true,
            fillColor: Colors.white, // Background color
            prefixIcon: prefixIcon, // Use the passed prefix icon
          ),
        ),
      ),
    );
  }
}
