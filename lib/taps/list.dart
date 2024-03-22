import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/themeData.dart';

import '../my_provider/provider.dart';
import 'list_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Container(
        height: 120,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
              ),
            ),
            DatePicker(
              height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: MyThemeData.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
              // New date selected
              // setState(() {
              //   _selectedValue = date;
            }),
          ],
        ),
      ),
      SizedBox(height: 16),
      
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16,);
          },
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListItem(),
          );
        },itemCount: 9,),
      )

    ]);
  }
}
