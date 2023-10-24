// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  static String id = "homeScreen";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return AddNoteSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: NotesViewBody(),
    );
  }
}
