import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seyahat/screens/authentication/forgot_password.dart';
import 'package:seyahat/screens/authentication/user_role_selection.dart';
import 'package:seyahat/widgets/custom_text_field.dart';
import 'package:seyahat/widgets/password_field.dart';

import '../main_screen.dart';

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
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email, color: Color(0xFF1A76D2)),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PasswordTextField(controller: passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
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
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  await _handleLogin(context, emailController.text, passwordController.text);
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context ,String email,String password) async {


    try {
      // Check in users collection
      var userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        // User found in users collection
        String username = userSnapshot.docs.first['name'];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(username: username),
          ),
        );
        return; // Exit after successful login
      }

      // Check in guides collection
      var guideSnapshot = await FirebaseFirestore.instance
          .collection('guides')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (guideSnapshot.docs.isNotEmpty) {
        // Guide found in guides collection
        String fullName = guideSnapshot.docs.first['fullName'];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(username: fullName),
          ),
        );
        return; // Exit after successful login
      }

      // If no user or guide is found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      print("Error logging in: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
