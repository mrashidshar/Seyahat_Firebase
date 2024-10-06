import 'package:flutter/material.dart';
import 'package:seyahat/screens/forgot_password.dart';
import 'package:seyahat/screens/user_role_selection.dart';
import '../widgets/password_field.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Adjust layout when keyboard appears
      body: SingleChildScrollView( // Make the body scrollable
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100), // Increased vertical padding to move content down
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A76D2),
              ),
            ),
            const SizedBox(height: 50),
            CustomTextField( // Using CustomTextField for email input
              controller: emailController,
              hintText: 'Email', // Hint for the email field
              prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)), // Email icon
            ),
            const SizedBox(height: 3), // Space between email and password field
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill the width
              children: [
                PasswordTextField(controller: passwordController),
                Align(
                  alignment: Alignment.centerRight, // Align to the right
                  child: TextButton(
                    onPressed: () {
                      // Navigate to ForgotPasswordPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF1A76D2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Space between password group and login button
            ElevatedButton(
              onPressed: () {
                // Handle login functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A76D2),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Handle navigation to sign up page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserRoleSelection(),
                  ),
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFA500),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40), // Space at the bottom
          ],
        ),
      ),
    );
  }
}
