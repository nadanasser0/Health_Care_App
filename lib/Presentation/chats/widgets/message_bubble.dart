import 'package:flutter/material.dart';
import 'package:health_care_app/core/constants/colors.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String? time;
  final String? avatar; 

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    this.time,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ?  AppColors.blueColor : AppColors.greyColor;
    final textColor = isMe ? AppColors.whiteColor : AppColors.blackColor;

    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isMe ? 16 : 4),
      bottomRight: Radius.circular(isMe ? 4 : 16),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: avatar != null
                  ? CircleAvatar(radius: 18, backgroundImage: AssetImage(avatar!))
                  : const SizedBox(width: 36),
            ),

          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.72),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: borderRadius,
                    boxShadow: isMe
                        ? [
                            BoxShadow(
                                color:AppColors.blackColor.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]
                        : null,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 15),
                  ),
                ),

                if (time != null)
                  Padding(
                    padding: EdgeInsets.only(
                      top: 6,
                      left: isMe ? 0 : 8,
                      right: isMe ? 8 : 0,
                    ),
                    child: Text(
                      time!,
                      style: TextStyle(fontSize: 11, color:AppColors.greyColor),
                    ),
                  ),
              ],
            ),
          ),

          if (isMe) const SizedBox(width: 8),
        ],
      ),
    );
  }
}