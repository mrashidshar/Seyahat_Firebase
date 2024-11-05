import 'package:flutter/material.dart';
import 'package:seyahat/widgets/guide_item.dart'; // Import your GuideItem widget
import 'package:seyahat/widgets/userprofile_widget.dart';
import 'package:seyahat/widgets/searchBar_widget.dart'; // Import your UserSearchBar

class SearchGuideScreen extends StatelessWidget {
  const SearchGuideScreen({super.key});

  // Simulated future data fetching function
  Future<List<Map<String, dynamic>>> fetchGuides() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));

    // Sample data for guides
    return [
      {
        'username': 'Alice Smith',
        'profilePicture': 'https://via.placeholder.com/150',
        'description': 'Expert in local history.',
        'rating': 4.5,
        'reviewCount': 120,
      },
      {
        'username': 'Bob Johnson',
        'profilePicture': 'https://via.placeholder.com/150',
        'description': 'Adventure guide with 10 years of experience.',
        'rating': 4.8,
        'reviewCount': 95,
      },
      {
        'username': 'Charlie Brown',
        'profilePicture': 'https://via.placeholder.com/150',
        'description': 'Cultural guide specializing in art.',
        'rating': 4.2,
        'reviewCount': 60,
      },
      // Add more guides as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text("Search Guides"),
        actions: const [
          UserProfile(username: 'Hanood'), // Include UserProfile widget
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const UserSearchBar(), // Use the custom UserSearchBar
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchGuides(), // Call the fetch function
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for data
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there's an error
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If no data is returned
                      return const Center(child: Text('No guides found.'));
                    } else {
                      // If data is successfully fetched
                      final guides = snapshot.data!;
                      return ListView.builder(
                        itemCount: guides.length,
                        itemBuilder: (context, index) {
                          final guide = guides[index];
                          return GuideItem(
                            username: guide['username'],
                            profilePicture: guide['profilePicture'],
                            description: guide['description'],
                            rating: guide['rating'],
                            reviewCount: guide['reviewCount'],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}