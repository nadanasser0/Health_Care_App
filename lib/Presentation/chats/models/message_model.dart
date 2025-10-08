enum MessageType { text, image, audio }

class Message {
  final String text;
  final bool isMe;
  final String time;
  final MessageType type;
  final String? filePath; // لو صورة أو صوت

  Message({
    required this.text,
    required this.isMe,
    required this.time,
    this.type = MessageType.text,
    this.filePath,
  });
}


List<Message> demoMessages(String chatName) => [
      Message(text: "Hi, $chatName 🙏", isMe: true, time: "09:10"),
      Message(text: "Good morning, how can I help you?", isMe: false, time: "09:40"),
      Message(text: "Good morning doctor, I have a headache and body aches.", isMe: true, time: "09:40"),
      Message(text: "Fine, how long has the complaint been?", isMe: false, time: "09:40"),
      Message(text: "It’s been about the last 3 days.", isMe: true, time: "09:40"),
      Message(
          text: "Fine, I’ll do a check. Does the patient have a history of certain diseases?",
          isMe: false,
          time: "09:40"),
    ];
