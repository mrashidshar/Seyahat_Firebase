import 'package:flutter/material.dart';
import 'package:seyahat/screens/authentication/user_signup_page.dart';


class UserRoleSelection extends StatelessWidget {
  const UserRoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Adjusted space for the AppBar
              _buildTitle(),
              const SizedBox(height: 50),
              _buildRoleOptions(context),
              const SizedBox(height: 10),
              _buildFlowerDecoration(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Text(
        "How Would You Like to Join?",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRoleOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRoleOption("Guide", 'assets/guide.png', () {
            // Navigate to Guide SignUp page (implement this page similarly)
          }),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey, // Color of the line
            thickness: 1, // Thickness of the line
            indent: 10, // Left padding for the line
            endIndent: 10, // Right padding for the line
          ),
          const SizedBox(height: 20),
          _buildRoleOption("User", 'assets/user.png', () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(), // Navigate to UserSignup page
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRoleOption(String role, String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(assetPath),
          ),
          const SizedBox(width: 20),
          Text(
            role,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlowerDecoration() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Image.asset(
        'assets/flower.png', // Flower image
        width: 150,
        height: 200,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserRoleSelection(),
  ));
}
