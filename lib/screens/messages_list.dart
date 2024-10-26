import 'package:flutter/material.dart';
import 'package:seyahat/screens/message_screen.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the MessagesScreen when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(), // Navigate to message screen
                  ),
                );
              },
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                title: Text('John Doe'),
                subtitle: Text('Hey, how are you?'),
                trailing: Text('2m ago'),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(),
                  ),
                );
              },
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                title: Text('Jane Smith'),
                subtitle: Text('Are we still on for the meeting?'),
                trailing: Text('10m ago'),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(),
                  ),
                );
              },
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                title: Text('Alice Johnson'),
                subtitle: Text('I sent you the files.'),
                trailing: Text('1h ago'),
              ),
            ),
            // Add more GestureDetector widgets for other messages
          ],
        ),
      ),
    );
  }
}
