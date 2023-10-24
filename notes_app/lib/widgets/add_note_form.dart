import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/circle_color.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  int color = const Color(0xFFE91E63).value;

  bool isLoading = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (Value) {
              title = Value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children:[
          //     colorCircle(Colors.amber.shade50),
          //     colorCircle(Colors.pink),
          //     colorCircle(Colors.amber),
          //     colorCircle(Colors.purple),
          //     colorCircle(Colors.blue),
          //   ],
          // ),
          const ColorsItemListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                buttonName: 'Add Note ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    String date = formattedDate(DateTime.now());
                    NoteModel note = NoteModel(
                      title: title!,
                      content: content!,
                      date: date,
                      color: color,
                    );
                    BlocProvider.of<AddNoteCubit>(context).AddNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  GestureDetector colorCircle(Color circleColor) {
    return GestureDetector(
      onTap: () {
        color = circleColor.value;
      },
      child: Icon(
        Icons.circle,
        color: circleColor,
      ),
    );
  }
}

String formattedDate(DateTime date) {
  final DateFormat formatter = DateFormat('d MMM y');
  return formatter.format(date);
}
