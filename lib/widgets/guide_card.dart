import 'package:flutter/material.dart';

class GuideCard extends StatelessWidget {
  final String username;
  final String profilePicture;
  final String description;

  const GuideCard({
    Key? key,
    required this.username,
    required this.profilePicture,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(profilePicture), // Use NetworkImage for profile pictures
        ),
        title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description, maxLines: 1, overflow: TextOverflow.ellipsis), // One-line description
      ),
    );
  }
}
