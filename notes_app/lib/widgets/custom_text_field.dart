// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.defaultValue = '',
  }) : super(key: key);

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  String defaultValue;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = defaultValue;
    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: Colors.cyanAccent,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.cyanAccent,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.cyanAccent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
