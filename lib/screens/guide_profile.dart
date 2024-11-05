import 'package:flutter/material.dart';

class GuideProfile extends StatelessWidget {
  final String username;
  final String profilePicture;
  final String description;
  final double rating;
  final int reviewCount;

  const GuideProfile({
    Key? key,
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // Handle message action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profilePicture), // Load image from URL
              ),
            ),
            const SizedBox(height: 16),
            // Username
            Text(
              username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            // Rating
            Row(
              children: List.generate(5, (index) {
                if (index < rating) {
                  return const Icon(Icons.star, color: Colors.amber);
                } else if (index < rating + 0.5) {
                  return const Icon(Icons.star_half, color: Colors.amber);
                } else {
                  return const Icon(Icons.star_border, color: Colors.amber);
                }
              }),
            ),
            const SizedBox(height: 4),
            // Review Count
            Text(
              '($reviewCount reviews)',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle booking action
                  },
                  child: const Text('Book Now'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle message action
                  },
                  child: const Text('Message'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}