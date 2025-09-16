import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/chats/models/message_model.dart';
import 'package:health_care_app/Presentation/chats/widgets/chat_input_field.dart';
import 'package:health_care_app/core/constants/colors.dart';

class ChatPage extends StatefulWidget {
  final String chatName;

  const ChatPage({super.key, required this.chatName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = demoMessages(widget.chatName);}

  void _sendMessage(String msg) {
    if (msg.trim().isEmpty) return;
    setState(() {
      _messages.add(Message(
        text: msg.trim(),
        isMe: true,
        time: TimeOfDay.now().format(context),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: AppBar(
            backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.chatName,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Online",
                  style: TextStyle(color: AppColors.greyColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isMe = msg.isMe;

                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment:
                          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.blueColor :AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: isMe ? Radius.zero : const Radius.circular(16),
                              bottomLeft: const Radius.circular(16),
                              bottomRight: const Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:AppColors.blackColor,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            msg.text,
                            style: TextStyle(
                              color: isMe ? AppColors.whiteColor :AppColors.blackColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                          child: Text(
                            msg.time,
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: ChatInput(
                onSend: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}