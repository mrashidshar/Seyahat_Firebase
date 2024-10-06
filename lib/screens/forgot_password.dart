import 'package:flutter/material.dart';
import 'package:seyahat/widgets/text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true, // Adjust layout when keyboard appears
      body: Center( // Center the content vertically and horizontally
        child: SingleChildScrollView( // Make the body scrollable
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              // const SizedBox(height: 05), // Space before the title
              const Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your email address and we will send you instructions to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 50), // Space after the description

              // Reusable email input field
              NameTextField(controller: emailController),
              const SizedBox(height: 25), // Space after the text field

              // Continue button
              ElevatedButton(
                onPressed: () {
                  // Handle forgot password logic (e.g., sending reset email)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A76D2), // Blue color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space after the button

              // Back to the platform link
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to the login page
                },
                child: const Text(
                  'Back to the Platform',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 40), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
