import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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
                color: Color(0xff5D9CEC),
              ),
            ),
            DatePicker(
              height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff5D9CEC),
                selectedTextColor: Colors.white, onDateChange: (date) {
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
