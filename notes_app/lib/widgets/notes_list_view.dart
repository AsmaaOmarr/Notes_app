import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReadNotesCubit>(context).readNotes();
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModel> list =
            BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
        print(list.length);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NoteItem(
                note: list[index],
              );
            },
          ),
        );
      },
    );
  }
}
