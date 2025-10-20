import 'package:flutter/material.dart';

class UserImageProfile extends StatelessWidget {
  const UserImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/13/11/22/86/360_F_1311228699_YoiLc5aJ3RWz3uRfdEtlV0UYSQjqf7RW.jpg',
                  ),
                ),
              ),
            );
  }
}