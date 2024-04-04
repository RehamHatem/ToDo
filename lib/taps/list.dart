import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/fire_base.dart';
import 'package:to_do_app/model.dart';
import 'package:to_do_app/themeData.dart';

import '../my_provider/provider.dart';
import 'list_item.dart';

class ToDoList extends StatefulWidget {

 ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  DateTime selectedDate=DateTime.now();

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
                initialSelectedDate: selectedDate,
                selectionColor: MyThemeData.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                selectedDate=date;
                setState(() {

                });
              // New date selected
              // setState(() {
              //   _selectedValue = date;
            }),
          ],
        ),
      ),
      SizedBox(height: 16),

      Expanded(

        child: StreamBuilder(stream: FirebaseFunctions.getTask(selectedDate),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasError){
            return Column(
              children: [
                Text("SomeThing Went Wrong"),
                ElevatedButton(onPressed: (){}, child: Text("Try Again"))
              ],
            );
          }
          List <TaskModel>tasksList=snapshot.data?.docs.map((e) => e.data() ).toList()?? [];
          if (tasksList.isEmpty){
            return Text("No Tasks ");
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(itemBuilder: (context, index) {
              return ListItem(model: tasksList[index],);
            }, separatorBuilder: (context, index) {
              return SizedBox(height: 16,);
            }, itemCount: tasksList.length),
          );
        },),
      )

    ]);
  }
}
