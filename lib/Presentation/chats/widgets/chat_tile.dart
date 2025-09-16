import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/Presentation/chats/view/chat_details_screen.dart';

class ChatTile extends StatefulWidget {
  final String name;
  final String specialization;
  final String lastMessage;
  final String time;
  final String image;
  int unreadCount;

  ChatTile({
    super.key,
    required this.name,
    required this.specialization,
    required this.lastMessage,
    required this.time,
    required this.image,
    this.unreadCount = 0,
  });

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.unreadCount = 0;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(chatName: widget.name),
          ),
        );
      },
      child: Padding(
            padding: const EdgeInsets.only(top: 7,left: 20,right: 20,bottom: 7),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.image),
                ),
                const SizedBox(width: 12),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.specialization,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 210,
                        child: Text(
                          
                          widget.lastMessage,
                          
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.greyColor,
                            height: 1.7,
                            
                          ),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  const SizedBox(height: 38),
                    if (widget.unreadCount > 0)
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.unreadCount.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
        Divider(height: 1,endIndent: 30,indent: 30,)
          ],
        ),
      ),
    );
  }
}