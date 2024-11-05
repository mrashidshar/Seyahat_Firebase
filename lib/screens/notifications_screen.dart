import 'package:flutter/material.dart';
import 'package:seyahat/widgets/notification_item.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
        title: const Text("Notifications"),
        actions: const [
          UserProfile(username: 'Hanood'), // Include UserProfile widget
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              Text(
                'New',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
              SizedBox(height: 20),
              Text(
                'Yesterday',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              NotificationItem(),
              NotificationItem(),
              NotificationItem(),
            ],
          ),
        ),
      ),
    );
  }
}
