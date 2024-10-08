import 'package:flutter/material.dart';
import 'package:seyahat/screens/search_guide.dart'; // Import the ExploreGuidesScreen

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped; // Callback to handle item tapping

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final List<IconData> _icons = const[
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
              onItemTapped(index); // Call the onItemTapped callback
              if (index == 2) {
                // Navigate to the ExploreGuidesScreen when the Search Guide icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreGuidesScreen(), // Navigate to ExploreGuidesScreen
                  ),
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _icons[index],
                  color: selectedIndex == index ? Colors.blue : Colors.grey,
                  size: 30, // Icon size
                ),
                const SizedBox(height: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Animation duration
                  width: selectedIndex == index ? 40 : 0, // Change width based on selection
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
