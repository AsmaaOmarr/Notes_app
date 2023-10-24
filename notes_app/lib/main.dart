import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/read_note_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // await Hive.initFlutter();
  // await Hive.openBox('notes_box');
  // Hive.registerAdapter(NoteModelAdapter();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kBoxName);

  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadNotesCubit(),
        ),
        // BlocProvider(
        //   create: (context) => AddNoteCubit(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          HomeView.id: (context) => HomeView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
