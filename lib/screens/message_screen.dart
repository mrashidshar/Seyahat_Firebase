import 'package:flutter/material.dart';
import 'package:seyahat/widgets/message_bubble.dart';
import 'package:seyahat/widgets/userprofile_widget.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with user profile
            const UserProfile(username: 'Hanood'),

            // Chat messages list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  // Date separator
                  Center(
                    child: Text(
                      'Thu, Dec. 29 10:31 AM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  MessageBubble(
                    sender: 'AltarSky',
                    username: ' altarskydev',
                    text: 'Text text text text text text text text text',
                    time: '10:31 AM',
                    isMe: false,
                  ),
                  MessageBubble(
                    sender: 'AltarSky',
                    username: ' ',
                    text: 'Text text text text text text text text text text',
                    time: '10:32 AM',
                    isMe: false,
                  ),
                  MessageBubble(
                    sender: 'AltarSky',
                    username: '',
                    text: 'Offer is created',
                    time: '10:35 AM',
                    isMe: false,
                  ),
                  MessageBubble(
                    sender: 'You',
                    username: '',
                    text: 'Click to accept',
                    time: '10:36 AM',
                    isMe: true,
                  ),
                ],
              ),
            ),

            // Text input area at the bottom
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      // Logic to send the message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}