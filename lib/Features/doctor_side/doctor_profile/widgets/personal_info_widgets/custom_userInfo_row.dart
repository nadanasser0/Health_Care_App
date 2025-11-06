import 'package:flutter/material.dart';
import 'package:health_care_app/Features/doctor_side/doctor_profile/widgets/personal_info_widgets/custom_profile_button.dart';
import 'package:health_care_app/core/constants/colors.dart';

class CustomUserinfoRow extends StatefulWidget {
  const CustomUserinfoRow({
    super.key,
    required this.controller,
    required this.label,
    required this.onSave,
  });

  final TextEditingController controller;
  final String label;
  final Future<void> Function(String newValue) onSave;

  @override
  State<CustomUserinfoRow> createState() => _CustomUserinfoRowState();
}

class _CustomUserinfoRowState extends State<CustomUserinfoRow> {
  bool isEditing = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '   ${widget.label}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                readOnly: !isEditing,
                decoration: InputDecoration(
                  hintText: "write your name",

                  filled: true,
                  fillColor: AppColors.whiteColor,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),


            CustomProfileButton(
              label: isEditing ? "Save" : "Edit",
              onPressed: () async {
                if (isEditing) {
                  await widget.onSave(widget.controller.text.trim());
                  setState(() => isEditing = false);
                } else {
                  setState(() => isEditing = true);
                  Future.delayed(const Duration(milliseconds: 100), () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  });
                }
              },
            ),
          ],
        ),

        // ),
      ],
    );
  }
}
