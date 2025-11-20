import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CustomRow({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200]!.withOpacity(0.6),
              child: Icon(icon, color: Colors.blue, size: 25),
            
            ),
            SizedBox(width: 20,),
            Text(text, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
            SizedBox(width: 50,),
          ],
        ),
        // SizedBox(width: 20,),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue , size: 20,),
          onPressed: onTap,
        ),
      ],
    );
  }
}