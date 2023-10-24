// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search_rounded,
            onPressed: (){},
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
