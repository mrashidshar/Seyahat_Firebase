import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart'; // Ensure the import path is correct
import 'package:seyahat/widgets/userprofile_widget.dart';

class ExploreMoreScreen extends StatefulWidget {
  final String placeName;
  final String imagePath;
  final String description;
  final String username;

  const ExploreMoreScreen({
    super.key, // Using the Key parameter for widget identification
    required this.placeName,
    required this.imagePath,
    required this.description,
    required this.username,
  }); // Pass key to the superclass

  @override
  ExploreMoreScreenState createState() => ExploreMoreScreenState(); // Correct synchronous usage
}

class ExploreMoreScreenState extends State<ExploreMoreScreen> { // Changed to public
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
              "Explore Place",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            UserProfile(username: widget.username), // Use the username here
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Image.asset(
              widget.imagePath,
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
                widget.placeName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
