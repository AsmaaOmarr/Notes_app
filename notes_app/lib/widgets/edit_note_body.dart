// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/read_note_cubit/read_notes_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/circle_color.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  final NoteModel note;

  const EditNoteBody({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check_rounded,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              String date = formattedDate(DateTime.now());
              widget.note.date = date;
              widget.note.save();
              BlocProvider.of<ReadNotesCubit>(context).readNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            defaultValue: widget.note.title,
            hint: "Title",
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            defaultValue: widget.note.content,
            hint: "Content",
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

String formattedDate(DateTime date) {
  final DateFormat formatter = DateFormat('d MMM y');
  return formatter.format(date);
}

class EditNoteColorsList extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsList({super.key, required this.note});

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    print(Color(widget.note.color));
    print(kColorList.indexOf(Color(widget.note.color)));
    print("hi");
    currentIndex = kColorList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16 * 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColorList[index].value;
                setState(() {});
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: kColorList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
