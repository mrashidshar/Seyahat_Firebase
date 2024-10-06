import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';

class ExploreMoreScreen extends StatelessWidget {
  final String placeName;
  final String imagePath;
  final String description;
  final String username; // Add username as a parameter

  const ExploreMoreScreen({
    super.key,
    required this.placeName,
    required this.imagePath,
    required this.description,
    required this.username, // Make sure to require it
  }); // Constructor initialization

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
              "Explore Place",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            UserProfile(username: username), // Use the username here
          ],
        ),
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Image.asset(
              imagePath, // Use the passed image path
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 35),

            // Horizontal scrolling list of images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/view.png', // Ensure this asset exists in your project
                          width: 90,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 45),

            // Title and Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                placeName, // Use the passed place name
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description, // Use the passed description
                style: const TextStyle(fontSize: 16, color: Colors.grey), // Use const for style consistency
              ),
            ),
          ],
        ),
      ),
      // Use your custom BottomNavBar widget
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
