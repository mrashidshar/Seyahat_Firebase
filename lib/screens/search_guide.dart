import 'package:flutter/material.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';
import 'package:seyahat/widgets/guide_card.dart';
import 'package:seyahat/widgets/userprofile_widget.dart'; // Import the UserProfile widget

class ExploreGuidesScreen extends StatefulWidget {
  const ExploreGuidesScreen({super.key});

  @override
  _ExploreGuidesScreenState createState() => _ExploreGuidesScreenState();
}

class _ExploreGuidesScreenState extends State<ExploreGuidesScreen> {
  int _selectedIndex = 2; // Initially, the "Search Guide" tab is selected
  List<GuideInfo> guides = []; // List to hold the filtered guides

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _generateRandomGuides(String query) {
    // Example guide information
    List<GuideInfo> allGuides = [
      GuideInfo(username: "John Doe", profilePicture: "https://example.com/john.jpg", description: "Experienced traveler."),
      GuideInfo(username: "Jane Smith", profilePicture: "https://example.com/jane.jpg", description: "Adventure enthusiast."),
      GuideInfo(username: "Emily Johnson", profilePicture: "https://example.com/emily.jpg", description: "Expert in cultural tours."),
      GuideInfo(username: "Michael Brown", profilePicture: "https://example.com/michael.jpg", description: "Nature lover."),
      GuideInfo(username: "Sarah Davis", profilePicture: "https://example.com/sarah.jpg", description: "History buff."),
      GuideInfo(username: "David Wilson", profilePicture: "https://example.com/david.jpg", description: "Food and travel blogger."),
    ];

    // Filter guides based on the query
    setState(() {
      guides = allGuides.where((guide) {
        return guide.username.toLowerCase().contains(query.toLowerCase()) ||
            guide.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 0, // Remove the shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: UserProfile(
              username: 'Hanood', // Example username
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GuideSearchBar(
              onSearch: _generateRandomGuides, // Call the random guide generator on search
            ),
          ),
          const SizedBox(height: 20), // Spacing
          // Display the list of guides
          Expanded(
            child: ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return GuideCard(
                  username: guide.username,
                  profilePicture: guide.profilePicture,
                  description: guide.description,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex, // Pass the current selected index
        onItemTapped: _onItemTapped,   // Pass the callback for handling item taps
      ),
    );
  }
}

// A simple model class to hold guide information
class GuideInfo {
  final String username;
  final String profilePicture;
  final String description;

  GuideInfo({
    required this.username,
    required this.profilePicture,
    required this.description,
  });
}


class GuideSearchBar extends StatelessWidget {
  final Function(String) onSearch; // Callback function for search

  const GuideSearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        onSearch(query); // Call the provided function when text changes
      },
      decoration: InputDecoration(
        hintText: 'Search for guides...', // Placeholder text
        prefixIcon: const Icon(Icons.search), // Search icon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey), // Border color
        ),
      ),
    );
  }
}
