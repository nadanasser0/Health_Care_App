class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final String image;
  final int unreadCount;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.image,
    required this.unreadCount,
  });
}

List<Chat> allChats = [
  Chat(
    name: "mazen Elsayed",
    lastMessage: "it's been about the last 3 days. ",
    time: "7:11 PM",
    image: "lib/images/patient.png",
    unreadCount: 1,
  ),
    Chat(
    name: "mazen Elsayed",
    lastMessage: "it's been about the last 3 days. ",
    time: "7:11 PM",
    image: "lib/images/patient.png",
    unreadCount: 1,
  ),
    Chat(
    name: "mazen Elsayed",
    lastMessage: "it's been about the last 3 days. ",
    time: "7:11 PM",
    image: "lib/images/patient.png",
    unreadCount: 1,
  ),
    Chat(
    name: "mazen Elsayed",
    lastMessage: "it's been about the last 3 days. ",
    time: "7:11 PM",
    image: "lib/images/patient.png",
    unreadCount: 1,
  ),

];