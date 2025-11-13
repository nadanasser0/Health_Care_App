// import 'package:flutter/material.dart';

// class CustomProfileInfoRow extends StatelessWidget {
//   const CustomProfileInfoRow({super.key, required this.icon, required this.text, required this.onTap});
//    final IconData icon;
//   final String text;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [

//         Row(
//           children: [

            
//             Text(text, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
//             SizedBox(width: 50,),
//           ],
//         ),

//         IconButton(
//           icon: const Icon(Icons.mode_edit_outline_rounded, color: Colors.blue , size: 25,),
//           onPressed: onTap,
//         ),
//       ],
//     );
//   }
//   }

import 'package:flutter/material.dart';

class CustomProfileInfoRow extends StatefulWidget {
  const CustomProfileInfoRow({
    super.key,
    required this.text,
    required this.onSave,
  });

  final String text;
  final Function(String) onSave; 

  @override
  State<CustomProfileInfoRow> createState() => _CustomProfileInfoRowState();
}

class _CustomProfileInfoRowState extends State<CustomProfileInfoRow> {
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _isEditing
              ? TextField(
                  controller: _controller,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),

                  decoration: const InputDecoration(
                    isDense: true,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
              : 
              Text(
                  _controller.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),

        IconButton(
          icon: Icon(
            _isEditing
                ? Icons.check_circle_outline 
                : Icons.mode_edit_outline_rounded, 
            color: Colors.blue,
            size: 25,
          ),
          onPressed: () {
            if (_isEditing) {
              widget.onSave(_controller.text);
            }
            setState(() {
              _isEditing = !_isEditing;
            });
          },
        ),
      ],
    );
  }
}


//   import 'package:flutter/material.dart';
// import 'package:health_care_app/core/constants/colors.dart';

// class CustomProfileInfoRow extends StatelessWidget {
//    final TextEditingController controller;
//   final bool isEditable;
//   final VoidCallback onEditTap;
//   const CustomProfileInfoRow({
//     super.key,
//     required this.controller,
//     required this.isEditable,
//     required this.onEditTap,
//   });
  
   
//   @override
//   Widget build(BuildContext context) {
//     return 
//     Row(
//         children: [

          
//           Expanded(
//             child: TextField(
//               controller: controller,
//               enabled: isEditable,

//               style: TextStyle(
//                 fontSize: 18, 
//                 fontWeight: FontWeight.w400,
//                 color: isEditable
//                     ? AppColors.blackColor.withOpacity(0.9)
//                     : AppColors.blackColor.withOpacity(0.6), 
//               ),

//               decoration: InputDecoration(
//                 isDense: true,
//                 // contentPadding:
//                 //     const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                 labelStyle: TextStyle(
//                   color: AppColors.blackColor,
//                   fontSize: 20,
//                 ),
//                 fillColor: Colors.transparent,
//                 border: OutlineInputBorder(borderSide: BorderSide.none),
//                 enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
//                 focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(
//               isEditable ? Icons.check : Icons.mode_edit_outline_outlined,
//               color: isEditable
//                   ? Colors.blue 
//                   : AppColors.blueColor, 
//               size: 25,
              
//             ),
//             highlightColor: AppColors.blueColor.withOpacity(0.1),
//             onPressed: onEditTap,
//           ),
//         ],
//       );
//     // Row(
//     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //   children: [

//     //     Row(
//     //       children: [

            
//     //         Text(text, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
//     //         SizedBox(width: 50,),
//     //       ],
//     //     ),

//     //     IconButton(
//     //       icon: const Icon(Icons.mode_edit_outline_rounded, color: Colors.blue , size: 25,),
//     //       onPressed: onTap,
//     //     ),
//     //   ],
//     // );
//   }
//   }