// landing_page.dart
import 'package:flutter/material.dart';
import 'package:seyahat/screens/main_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to MainScreen after 5 seconds (for demo)
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      ); // Navigate to main screen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/seyahat.png', // Add your image path here
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  "DISCOVER YOUR NEXT ADVENTURE WITH\nOUR TRUSTED GUIDES!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(1000),
              topRight: Radius.circular(1000),
            ),
            child: Container(
              width: 351,
              height: 170, // Adjusted height for better spacing
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF164C94),
                    Color(0xFF4A90E2), // Moderate light blue
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 20,
                    blurRadius: 30,
                    offset: const Offset(0, 20), // changes position of shadow
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20), // Added padding to the bottom
                child: Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
