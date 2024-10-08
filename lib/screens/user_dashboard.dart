import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';
import 'package:seyahat/widgets/suggested_place_card_widget.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';
import 'package:seyahat/widgets/searchBar_widget.dart'; // Ensure this matches the file name

class DashboardScreen extends StatefulWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

  @override
  _DashboardScreenState createState() => _DashboardScreenState(); // Correct usage for createState
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Initialize the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            UserProfile(username: widget.username), // Use the username here
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserSearchBar(key: ValueKey('searchBar')),
            const SizedBox(height: 20),
            const Text(
              "Suggested Places",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SuggestedPlaceCard(
                    placeName: "Shangrilla Lake",
                    description: "Beautiful place to relax and enjoy nature. " * 5, // Shortened for readability
                    imagePath: 'assets/view.png',
                    username: widget.username, // Pass the username here
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex, // Pass the current selected index
        onItemTapped: _onItemTapped,   // Pass the callback function
      ),
    );
  }
}
