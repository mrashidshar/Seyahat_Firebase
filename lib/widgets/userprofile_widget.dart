import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String username;

  const UserProfile({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.03), // Responsive space
        Text(
          username,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04, // Responsive font size
            color: Colors.grey,
          ),
        ),
        SizedBox(width: screenWidth * 0.03), // Responsive space between text and icon
        const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
