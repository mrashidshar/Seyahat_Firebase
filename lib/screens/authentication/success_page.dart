import 'package:flutter/material.dart';

import 'login_page.dart';

class SuccessPage extends StatelessWidget {
  final String username;

  const SuccessPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Image at the top
              Image.asset(
                'assets/success.png', // Add your success image here
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 30), // Space between image and text

              // Success text
              const Text(
                "Success!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20), // Space between Success and message

              // Confirmation message
              const Text(
                "You have successfully registered in our app.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Space before button

              // Confirmation Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to DashboardPage and pass the username
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(onLoginSuccess: () {  },), // Pass the username
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Go to Login", // Updated button text
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
