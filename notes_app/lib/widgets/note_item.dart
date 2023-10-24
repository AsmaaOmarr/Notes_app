// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/read_note_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note,);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
        //width: double.infinity,
        //height: 180,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  note.content,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  note.delete();
                  BlocProvider.of<ReadNotesCubit>(context).readNotes();
                },
                child: Icon(
                  Icons.delete_rounded,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            //Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Text(
                note.date,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
