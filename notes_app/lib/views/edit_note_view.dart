// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  static String id = 'editNoteView';
  final NoteModel note;

  const EditNoteView({
    Key? key,
    required this.note,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteBody(note: note,),
    );
  }
}
