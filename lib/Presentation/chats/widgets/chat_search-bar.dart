import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const ChatSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search Message",
          prefixIcon: const Icon(CupertinoIcons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}