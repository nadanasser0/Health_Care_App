class Chat {
  final String name;
  final String specialization;
  final String lastMessage;
  final String time;
  final String image;
  final int unreadCount;

  Chat({
    required this.name,
    required this.specialization,
    required this.lastMessage,
    required this.time,
    required this.image,
    required this.unreadCount,
  });
}

List<Chat> allChats = [
  Chat(
    name: "Dr. Randy Wigham",
    specialization: "General Doctor | RSUD Gatot Subroto",
    lastMessage: "Fine, I'll do a check. Does the patient have a history of certain diseases?",
    time: "7:11 PM",
    image: "lib/images/doc1(chat).jpg",
    unreadCount: 1,
  ),
  Chat(
    name: "Dr. Jack Sulivan",
    specialization: "General Doctor | RSUD Gatot Subroto",
    lastMessage: "Fine, I’ll do a check. Does the patient have a history of certain diseases?",
    time: "7:11 PM",
    image: "lib/images/doc2(chat).jpg",
    unreadCount: 1,
  ),
  Chat(
    name: "Dr. Hanna Stanton",
    specialization: "General Doctor | RSUD Gatot Subroto",
    lastMessage: "Fine, I’ll do a check. Does the patient have a history of certain diseases?",
    time: "7:11 PM",
    image: "lib/images/doc3(chat).jpg",
    unreadCount: 0,
  ),
  Chat(
    name: "Dr. Emery Lubin",
    specialization: "General Doctor | RSUD Gatot Subroto",
    lastMessage: "Fine, I’ll do a check. Does the patient have a history of certain diseases?",
    time: "7:11 PM",
    image: "lib/images/doc4(chat).jpg",
    unreadCount: 1,
  ),
];