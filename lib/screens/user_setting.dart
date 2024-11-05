import 'package:flutter/material.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text("User Settings"),
        actions: const [
          UserProfile(username: 'Hanood'), // Include UserProfile widget
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/user.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // User Information
                Text(
                  'Arden Jhone',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'City Explorer',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                // Input Fields as Cards with Icons
                _buildCardInput(Icons.person, 'Name', 'Melissa Peters'),
                const SizedBox(height: 10),
                _buildCardInput(Icons.email, 'Email', 'melpeters@gmail.com'),
                const SizedBox(height: 10),
                _buildCardInput(Icons.lock, 'Password', '*********', obscureText: true),
                const SizedBox(height: 10),
                _buildCardInput(Icons.phone, 'Phone number', '123-456-7890'),
                const SizedBox(height: 10),
                _buildCardInput(Icons.location_on, 'Country/Region', 'Nigeria'),
                const SizedBox(height: 20),
                // Save Changes Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save changes
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardInput(IconData icon, String label, String placeholder, {bool obscureText = false}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: label,
                  hintText: placeholder,
                  border: InputBorder.none, // No border for card style
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
