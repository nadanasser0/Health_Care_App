import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import '../widgets/chat_tile.dart';
import 'package:flutter/cupertino.dart';
import '../models/chat_model.dart'; // استدعاء الموديل

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final TextEditingController _searchController = TextEditingController();

  late List<Chat> filteredChats;

  @override
  void initState() {
    super.initState();
    filteredChats = List.from(allChats);
  }

  void _filterChats(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredChats = List.from(allChats);
      } else {
        filteredChats = allChats.where((chat) {
          return chat.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: 
      AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Messages",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: TextField(
                controller: _searchController,
                onChanged: _filterChats,
                decoration: InputDecoration(
                  hintText: "Search Message",
                  iconColor: AppColors.greyColor,
                  prefixIcon: const Icon(CupertinoIcons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredChats.length,
                itemBuilder: (context, index) {
                  final chat = filteredChats[index];
                  return ChatTile(
                    name: chat.name,
                    specialization: chat.specialization,
                    lastMessage: chat.lastMessage,
                    time: chat.time,
                    image: chat.image,
                    unreadCount: chat.unreadCount,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}