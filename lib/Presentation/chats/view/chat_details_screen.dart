import 'dart:io';
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
  final ScrollController _scrollController = ScrollController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = demoMessages(widget.chatName);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _sendMessage(String msg,
      {MessageType type = MessageType.text, String? filePath}) {
    if (msg.trim().isEmpty && filePath == null) return;

    setState(() {
      _messages.add(
        Message(
          text: msg.trim(),
          isMe: true,
          time: TimeOfDay.now().format(context),
          type: type,
          filePath: filePath,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset:
          true,       appBar: PreferredSize(
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
                controller:
                    _scrollController, // ✅ نتحكم في حركة القائمة لما نضيف رسالة
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  final isMe = msg.isMe;

                  Widget messageContent;

                  switch (msg.type) {
                    case MessageType.text:
                      messageContent = Text(
                        msg.text,
                        style: TextStyle(
                          color: isMe
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                      );
                      break;
                    case MessageType.image:
                      messageContent = ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(msg.filePath!),
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case MessageType.audio:
                      messageContent = Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow,
                              color: isMe
                                  ? AppColors.whiteColor
                                  : AppColors.blueColor),
                          const SizedBox(width: 8),
                          Text(
                            "Voice message",
                            style: TextStyle(
                              color: isMe
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ],
                      );
                      break;
                  }

                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMe
                                ? AppColors.blueColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              )
                            ],
                          ),
                          child: messageContent,
                        ),
                        Text(
                          msg.time,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.greyColor,
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
                onSend: (msg, {type = MessageType.text, filePath}) {
                  _sendMessage(msg, type: type, filePath: filePath);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}