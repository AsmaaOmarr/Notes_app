// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon, 
     required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
