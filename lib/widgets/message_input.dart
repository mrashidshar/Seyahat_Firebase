import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmojiVisible = false;

  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      _controller.text += emoji.emoji; // Append the selected emoji to the text field
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header with back arrow and user profile icon
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back
                },
              ),
              const Text(
                'Chat', // Title or username can go here
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Handle user profile action
                  print('User profile tapped'); // Replace with actual action
                },
              ),
            ],
          ),
        ),

        // Input area with emoji and send buttons
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.emoji_emotions),
                onPressed: () {
                  setState(() {
                    _isEmojiVisible = !_isEmojiVisible; // Toggle emoji picker visibility
                  });
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type your message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Handle send button logic
                  print(_controller.text); // Replace this with your sending logic
                  _controller.clear(); // Clear input after sending
                },
              ),
            ],
          ),
        ),

        // Emoji picker (shows when emoji button is clicked)
        if (_isEmojiVisible)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                _onEmojiSelected(emoji); // Call the method when an emoji is selected
              },
              // config: Config(
              //   columns: 7,
              //   emojiSizeMax: 32,
              //   verticalSpacing: 0,
              //   horizontalSpacing: 0,
              //   gridPadding: EdgeInsets.zero,
              //   bgColor: const Color(0xFFF2F2F2),
              //   enableSkinTones: true,
              //   showRecentsTab: true,
              // ),
            ),
          )
        else
          const SizedBox.shrink(), // Show nothing if emoji picker is hidden
      ],
    );
  }
}
