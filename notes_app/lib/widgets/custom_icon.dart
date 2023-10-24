// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  const CustomIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
