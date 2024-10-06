import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String username;

  const UserProfile({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display Username
        const SizedBox(width: 12), // Space between text and icon
        Text(
          username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey, // Set to gray
          ),
        ),
        const SizedBox(width: 12), // Space between text and icon
        // Profile Icon
        const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
