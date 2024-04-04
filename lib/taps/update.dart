import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/fire_base.dart';
import 'package:to_do_app/model.dart';
import 'package:to_do_app/themeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_provider/provider.dart';

class UpdateTask extends StatefulWidget {
  static const String routeName="update";
  const UpdateTask({super.key});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  var formKey=GlobalKey<FormState>();
  DateTime selectedDate=DateTime.now();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    var name=ModalRoute.of(context)!.settings.arguments as TaskModel ;
    titleController.text=name.title;
    descriptionController.text=name.description;

    return Container(
      decoration: BoxDecoration(
        color: prov.mood==ThemeMode.light? MyThemeData.bgColor:MyThemeData.bgDarkColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("${AppLocalizations.of(context)!.update}"),
        ),
        body: Column(
          children: [
        Stack(

          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: MyThemeData.primaryColor,
              ),
            ),
          Card(
            color: prov.mood==ThemeMode.light? Colors.white:MyThemeData.primaryDarkColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
            margin: EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50,top: 40,left: 16,right: 16),
                child: Column(
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.edittask}",
                      style: prov.mood==ThemeMode.light?MyThemeData.light.textTheme.bodyMedium:MyThemeData.dark.textTheme.bodyMedium,),
                    SizedBox(
                      height: 40,
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
                      height: 40,
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
                      height: 60,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${AppLocalizations.of(context)!.selectdate}",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                        )),
                    SizedBox(
                      height: 40,
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
                      height: 60,
                    ),
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              TaskModel afterUpdate=TaskModel(description: descriptionController.text, title: titleController.text, date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,id: name.id);
                              FirebaseFunctions.updateTask(afterUpdate.id, afterUpdate);
                              print ("=============changed============");
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "${AppLocalizations.of(context)!.save}",
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
            ),
          ),
        ],
          ),
      ]),)
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
