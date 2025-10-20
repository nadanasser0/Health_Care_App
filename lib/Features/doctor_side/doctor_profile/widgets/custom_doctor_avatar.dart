import 'package:flutter/material.dart';

class CustomDoctorAvatar extends StatelessWidget {
  const CustomDoctorAvatar({super.key, required this.docName});
  final String docName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[100],
          child: Image.asset("", fit: BoxFit.cover),
        ),
        SizedBox(height: 10),
        Text(
          docName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
