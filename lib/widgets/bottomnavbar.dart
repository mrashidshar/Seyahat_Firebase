import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Track the selected icon's index

  final List<IconData> _icons = [
    Icons.home,
    Icons.message,
    Icons.travel_explore, // Search Guide icon
    Icons.notifications,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Height of the bottom nav bar
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)), // No curved edges for rectangular shape
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -3), // Shadow above the bar
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space icons evenly
        children: List.generate(_icons.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index; // Update the selected index
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _icons[index],
                  color: _selectedIndex == index ? Colors.blue : Colors.grey,
                  size: 30, // Icon size
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Animation duration
                  width: _selectedIndex == index ? 40 : 0, // Change width based on selection
                  height: 2, // Height of the line
                  color: Colors.blue, // Color of the line
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
