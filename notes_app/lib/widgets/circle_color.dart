// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 14,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 16,
          );
  }
}

class ColorsItemListView extends StatefulWidget {
  const ColorsItemListView({super.key});

  @override
  State<ColorsItemListView> createState() => _ColorsItemListViewState();
}

class _ColorsItemListViewState extends State<ColorsItemListView> {
  int? currentIndex;
  
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
                BlocProvider.of<AddNoteCubit>(context).color = kColorList[index];
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
