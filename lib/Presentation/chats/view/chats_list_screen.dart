import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import '../widgets/chat_tile.dart';
import 'package:flutter/cupertino.dart';
import '../models/chat_model.dart';
class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});
  @override
  State<ChatsListScreen> createState() => _ChatsListScreen();
}

class _ChatsListScreen extends State<ChatsListScreen> {
  final TextEditingController _searchController = TextEditingController();

  late List<Chat> filteredChats;


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
    filled: true,
    fillColor: AppColors.whiteColor,

    // الإطار لما التكست في الحالة العادية
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: AppColors.greyColor, // لون الإطار
        width: 1.0, // سُمك الإطار
      ),
    ),

    // الإطار لما يكون الـ TextField واخد فوكس
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: AppColors.greyColor,
        width: 1.5,
      ),
    ),
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
  void initState() {
    super.initState();
    filteredChats = List.from(allChats);
  }

}