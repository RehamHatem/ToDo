import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/fire_base.dart';
import 'package:to_do_app/model.dart';
import 'package:to_do_app/themeData.dart';

import 'my_provider/provider.dart';

class TaskModelSheet extends StatefulWidget {
   TaskModelSheet({super.key});

  @override
  State<TaskModelSheet> createState() => _TaskModelSheetState();
}

class _TaskModelSheetState extends State<TaskModelSheet> {
var formKey=GlobalKey<FormState>();
DateTime selectedDate=DateTime.now();
TextEditingController descriptionController=TextEditingController();
TextEditingController titleController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${AppLocalizations.of(context)!.addTask}",
              style: prov.mood==ThemeMode.light?MyThemeData.light.textTheme.bodyMedium:MyThemeData.dark.textTheme.bodyMedium,),
            SizedBox(
              height: 16,
            ),
            TextFormField(
          validator: (value) {
        if(value==null || value.isEmpty){
          return "${AppLocalizations.of(context)!.terror}";
        }},
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  "${AppLocalizations.of(context)!.title}",
                  style: TextStyle(fontSize: 20),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:  MyThemeData.primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:  MyThemeData.primaryColor)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if(value==null || value.isEmpty){
                  return "${AppLocalizations.of(context)!.derror}";
                }
              },
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text(
                  "${AppLocalizations.of(context)!.description}",
                  style: TextStyle(fontSize: 20),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:  MyThemeData.primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color:  MyThemeData.primaryColor)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${AppLocalizations.of(context)!.selectdate}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text("${selectedDate.toString().substring(0,10)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyThemeData.primaryColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      TaskModel task=TaskModel(
                        userId: FirebaseAuth.instance.currentUser!.uid,
                          description: descriptionController.text, title: titleController.text, date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                      FirebaseFunctions.addTask(task);
                        Navigator.pop(context);

                    }
                  },
                  child: Text(
                    "${AppLocalizations.of(context)!.add}",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),

                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.transparent),
                    elevation: MaterialStatePropertyAll(0),),
                ))
          ],
        ),
      ),
    );
  }
  selectDate(BuildContext context)async{
     DateTime? chosenDate=await showDatePicker(context: context, initialDate: selectedDate, firstDate: selectedDate, lastDate: selectedDate.add(Duration(days: 365)));
     if (chosenDate!=null){
       selectedDate=chosenDate;
       setState(() {

       });
     }
  }
}
