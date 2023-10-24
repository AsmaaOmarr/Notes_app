import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());

  List<NoteModel>? notes;
  void readNotes() {
    var notesBox =  Hive.box<NoteModel>(kBoxName);
    notes =  notesBox.values.toList();
    emit(ReadNoteSuccess());
    //return notes;
  }
}
