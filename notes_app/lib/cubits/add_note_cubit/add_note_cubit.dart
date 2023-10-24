import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? color = const Color(0xFFE91E63);

  void AddNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kBoxName);
      await notesBox.add(note);
      emit(AddNoteSuccess());
      print('success');
    } catch (e) {
      emit(AddNoteFailure(errorMsg: 'Can\'t Add Note ${e.toString()}'));
    }
  }
}
