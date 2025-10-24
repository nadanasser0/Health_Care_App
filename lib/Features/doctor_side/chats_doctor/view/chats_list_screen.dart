import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import '../models/chat_model.dart';
import 'chat_details_screen.dart';

class ChatsListScreenDoctor extends StatefulWidget {
  const ChatsListScreenDoctor({super.key});

  @override
  State<ChatsListScreenDoctor> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreenDoctor> {
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
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(CupertinoIcons.back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title:  Text(
          "Chats",
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterChats,
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(CupertinoIcons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Active Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 85,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allChats.length,
                itemBuilder: (context, index) {
                  final chat = allChats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(chatName: chat.name),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color:AppColors.whiteColor, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withOpacity(.4),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundImage: AssetImage(chat.image),
                            ),
                          ),
                          Positioned(
                            top: .1,
                            right: .1,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color:AppColors.greenColor,
                                shape: BoxShape.circle,
                                border: Border.all(color:AppColors.whiteColor, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Message",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredChats.length,
                itemBuilder: (context, index) {
                  final chat = filteredChats[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(chatName: chat.name),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color:AppColors.whiteColor, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withOpacity(.3),
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundImage: AssetImage(chat.image),
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        chat.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      chat.time,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        chat.lastMessage,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColors.greyColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    if (chat.unreadCount > 0)
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: AppColors.greenColor,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          chat.unreadCount.toString(),
                                          style:  TextStyle(
                                            color:AppColors.whiteColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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