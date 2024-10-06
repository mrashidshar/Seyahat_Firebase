import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the field
          borderRadius: BorderRadius.circular(30), // Same border radius as the TextField
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
          decoration: InputDecoration(
            labelText: 'Email', // Change label for the email field
            labelStyle: TextStyle(color: Colors.blue[800]), // Customize label color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
              borderSide: BorderSide(color: Colors.grey.shade300), // Light grey border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFF1A76D2)), // Change to your desired color
            ),
            filled: true,
            fillColor: Colors.white, // Background color
            prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)), // Email icon
          ),
        ),
      ),
    );
  }
}
