import 'package:flutter/material.dart';
import 'package:seyahat/screens/explore_more.dart'; // Ensure this import is correct

class SuggestedPlaceCard extends StatelessWidget {
  final String placeName;
  final String imagePath;
  final String description;
  final String username; // Add username as a required parameter

  const SuggestedPlaceCard({
    super.key,
    required this.placeName,
    required this.imagePath,
    required this.description,
    required this.username, // Require username
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3, // Increase elevation for depth
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if the screen width is too small (less than 600px)
            bool isSmallScreen = constraints.maxWidth < 600;

            return isSmallScreen
                ? Column( // Switch to column layout on small screens
              children: [
                // Place Image
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Place Information
                buildPlaceInfo(context),
              ],
            )
                : Row( // Default row layout for larger screens
              children: [
                // Place Image
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Place Information
                Expanded(
                  flex: 6,
                  child: buildPlaceInfo(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Extracted method for place information to reuse in both layouts
  Column buildPlaceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 3),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExploreMoreScreen(
                    placeName: placeName,
                    imagePath: imagePath,
                    description: description,
                    username: username, // Pass the username here
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 30), // Set button size (width, height)
              padding: const EdgeInsets.symmetric(
                  vertical: 6, horizontal: 12), // Adjust padding
              backgroundColor: const Color(0xFF134586), // Button's background color
            ),
            child: const Text(
              "Explore more",
              style: TextStyle(
                color: Colors.white, // Set button text color to white
                fontSize: 12, // Keep the font size small
              ),
            ),
          ),
        ),
      ],
    );
  }
}
