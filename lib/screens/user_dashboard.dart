import 'package:flutter/material.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';
import 'package:seyahat/widgets/suggested_place_card_widget.dart';

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
      body: const DashboardBody(), // Render the appropriate screen without BottomNavBar
    );
  }
}

// DashboardBody widget
class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  description: "Beautiful place to relax and enjoy nature." * 5,
                  imagePath: 'assets/view.png',
                  username: 'Sample User',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
