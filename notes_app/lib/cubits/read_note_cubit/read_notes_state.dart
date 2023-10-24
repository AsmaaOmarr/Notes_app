part of 'read_notes_cubit.dart';

@immutable
abstract class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNoteLoading extends ReadNotesState {}

final class ReadNoteSuccess extends ReadNotesState {}

final class ReadNoteFailure extends ReadNotesState {
  final String errorMsg;

  ReadNoteFailure({required this.errorMsg});
}
