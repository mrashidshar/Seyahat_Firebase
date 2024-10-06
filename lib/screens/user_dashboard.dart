import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';
import 'package:seyahat/widgets/suggested_place_card_widget.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';
import 'package:seyahat/widgets/searchBar_widget.dart'; // Ensure this matches the file name

class DashboardScreen extends StatelessWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

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
            UserProfile(username: username),
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
                    description: "Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. "
                        "Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. "
                        "Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. "
                        "Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. Beautiful place to relax and enjoy nature. ",

                    imagePath: 'assets/view.png',
                    username: username, // Pass the username here
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Include the bottom nav bar here
    );
  }
}
