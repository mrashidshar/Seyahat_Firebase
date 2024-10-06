import 'package:flutter/material.dart';

class UserSearchBar extends StatelessWidget {
  const UserSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a place',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
