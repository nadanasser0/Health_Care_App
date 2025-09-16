import 'package:flutter/material.dart';
import 'package:health_care_app/Presentation/chats/view/chats_list_screen.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatListPage()
    );}
}
