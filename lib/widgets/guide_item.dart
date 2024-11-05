import 'package:flutter/material.dart';
import 'package:seyahat/screens/guide_profile.dart'; // Import your GuideProfile screen

class GuideItem extends StatelessWidget {
  final String username;
  final String profilePicture;
  final String description;
  final double rating; // For rating
  final int reviewCount; // For review count

  const GuideItem({
    Key? key,
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column: Image and Rating
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(profilePicture), // Load image from URL
                ),
                const SizedBox(height: 15), // Spacing between image and stars
                // Stars aligned vertically
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    if (index < rating) {
                      return const Icon(Icons.star, color: Colors.amber, size: 10);
                    } else if (index < rating + 0.5) {
                      return const Icon(Icons.star_half, color: Colors.amber, size: 10);
                    } else {
                      return const Icon(Icons.star_border, color: Colors.amber, size: 10);
                    }
                  }),
                ),
                const SizedBox(height: 4), // Spacing for review count
                Text(
                  '($reviewCount reviews)',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 12), // Spacing between columns

            // Second Column: Username, Description, and Buttons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4), // Spacing
                      Text(
                        description,
                        maxLines: 4, // Increased max lines for description
                        overflow: TextOverflow.ellipsis, // Ensures overflow is handled
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Aligns buttons to the right
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue button color
                          minimumSize: const Size(70, 30), // Short width
                        ),
                        onPressed: () {
                          // Navigate to GuideProfile when "View Profile" is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GuideProfile(
                                username: username,
                                profilePicture: profilePicture,
                                description: description,
                                rating: rating,
                                reviewCount: reviewCount,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'View Profile',
                          style: TextStyle(color: Colors.white, fontSize: 10), // White text color and reduced font size
                        ),
                      ),
                      const SizedBox(width: 5), // Spacing between button and icon
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {
                          // Handle message action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}