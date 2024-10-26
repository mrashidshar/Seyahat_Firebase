import 'package:flutter/material.dart';
import 'package:seyahat/screens/authentication/forgot_password.dart';
import 'package:seyahat/screens/authentication/user_role_selection.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/password_field.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onLoginSuccess; // Callback for login success

  const LoginPage({super.key, required this.onLoginSuccess}); // Constructor accepting callback

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Allows layout to adjust for keyboard
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismisses the keyboard when tapping outside
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
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
              CustomTextField( // CustomTextField for email input
                controller: emailController,
                hintText: 'Email', // Hint for the email field
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)),
              ),
              const SizedBox(height: 20), // Space between fields
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Make the column stretch across the screen
                children: [
                  PasswordTextField(controller: passwordController), // Custom password field
                  Align(
                    alignment: Alignment.centerRight,
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
              const SizedBox(height: 50), // Space before the login button
              ElevatedButton(
                onPressed: () {
                  // Handle login functionality here
                  // Simulate successful login and call the callback
                  onLoginSuccess(); // Call the login success callback
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
                  // Navigate to the sign-up page
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
      ),
    );
  }
}
