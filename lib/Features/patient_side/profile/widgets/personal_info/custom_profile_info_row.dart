import 'package:flutter/material.dart';

class CustomProfileInfoRow extends StatelessWidget {
  const CustomProfileInfoRow({super.key, required this.icon, required this.text, required this.onTap});
   final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [

            // CircleAvatar(
            //   radius: 30,
            //   backgroundColor: Colors.grey[200],
            //   child: Icon(icon, color: Colors.blue, size: 25),
            
            // ),
          // TextFormField(

          // ),
            // SizedBox(width: 30,),
            Text(text, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(width: 50,),
          ],
        ),
        // SizedBox(width: 20,),
        IconButton(
          icon: const Icon(Icons.mode_edit_outline_rounded, color: Colors.blue , size: 25,),
          onPressed: onTap,
        ),
      ],
    );
  }
  }