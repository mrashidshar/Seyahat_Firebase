import 'package:flutter/material.dart';
import 'package:seyahat/screens/authentication/login_page.dart';
import 'package:seyahat/screens/messages_list.dart';
import 'package:seyahat/screens/user_setting.dart';
import 'package:seyahat/screens/search_guide_screen.dart';

import 'package:seyahat/screens/notifications_screen.dart';
import 'package:seyahat/widgets/bottomnavbar.dart';
import 'package:seyahat/widgets/suggested_place_card_widget.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';

class MainScreen extends StatefulWidget {
final String username; // Add this line

const MainScreen({super.key, required this.username}); // Modify constructor

@override
_MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isLoggedIn = false; // Variable to track login status

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Check login status on initialization
  }

  void _checkLoginStatus() {
    // Implement your logic to check if the user is logged in
    // For example, check a token or a shared preference
    setState(() {
      // Simulating a check (replace with your logic)
      isLoggedIn = false; // Change to true if the user is logged in
    });
  }

  void loginUser() {
    setState(() {
      isLoggedIn = true; // Update the login status when user logs in
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      return LoginPage(onLoginSuccess: loginUser); // Pass the login callback
    }

    // List of screens to display
    final List<Widget> _screens = [
      const DashboardScreen(username: ''), // Home screen
      const SearchGuideScreen(),                // Search screen
      const NotificationScreen(),                 // Notifications screen
      const UserSettingsPage(),                  // Settings screen
      const MessagesList(),                     // Messages screen
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index; // Update selected index
      });
    }

    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass the method to handle taps
      ),
    );
  }
}

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
      body: const DashboardBody(),  // Render the appropriate screen without BottomNavBar
    );
  }
}

// Existing DashboardBody widget
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
