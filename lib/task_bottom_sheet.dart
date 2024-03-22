import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/themeData.dart';

class TaskModelSheet extends StatefulWidget {
   TaskModelSheet({super.key});

  @override
  State<TaskModelSheet> createState() => _TaskModelSheetState();
}

class _TaskModelSheetState extends State<TaskModelSheet> {
var formKey=GlobalKey<FormState>();
DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${AppLocalizations.of(context)!.addTask}",
              style: MyThemeData.light.textTheme.bodyMedium,),
            SizedBox(
              height: 16,
            ),
            TextFormField(
          validator: (value) {
        if(value==null || value.isEmpty){
          return "${AppLocalizations.of(context)!.terror}";
        }},
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
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      print("========");
                    }
                  },
                  child: Text(
                    "${AppLocalizations.of(context)!.add}",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
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
