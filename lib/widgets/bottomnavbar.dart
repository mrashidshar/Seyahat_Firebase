import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color for the bottom nav bar
      padding: const EdgeInsets.symmetric(vertical: 5), // Padding around the nav bar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space icons evenly
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.blue), // Home icon
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.blue), // Person icon
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message, color: Colors.blue), // Message icon
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue), // Notification bell icon
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.blue), // Settings icon
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
