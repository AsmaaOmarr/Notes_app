// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.cyanAccent),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : Text(
                  buttonName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
        ),
      ),
    );
  }
}
