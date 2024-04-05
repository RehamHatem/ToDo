
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/fire_base.dart';
import 'package:to_do_app/model.dart';
import 'package:to_do_app/taps/update.dart';
import 'package:to_do_app/themeData.dart';

import '../my_provider/provider.dart';

class ListItem extends StatefulWidget {
  TaskModel model;
  ListItem({required this.model});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    return Slidable(
      startActionPane: ActionPane(motion: DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            FirebaseFunctions.daleteTask(widget.model.id);

          },
          backgroundColor: Colors.red,
          label: "${AppLocalizations.of(context)!.delete}",
          spacing: 20,
          icon: Icons.delete,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
        ),
        SlidableAction(onPressed: (context) {
          if(widget.model.isDone==false){
            Navigator.pushNamed(context, UpdateTask.routeName,arguments: widget.model);
          }

        },
        backgroundColor: Colors.blue,
        label:"${AppLocalizations.of(context)!.edit}",
          spacing: 20,

          icon: Icons.edit,)

      ]),
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: pro.mood==ThemeMode.light? Colors.white:Color(0xff141922),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 80,
              width: 4,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  // "${AppLocalizations.of(context)!.tasktitle}",
                  widget.model.title,
                  style: pro.mood==ThemeMode.light? MyThemeData.light.textTheme.bodyMedium:MyThemeData.dark.textTheme.bodyMedium
                ),
                subtitle: Text(
                  // "${AppLocalizations.of(context)!.taskdesc}",
                  widget.model.description,
                    style: pro.mood==ThemeMode.light? MyThemeData.light.textTheme.bodySmall:MyThemeData.dark.textTheme.bodySmall
                ),
                trailing: InkWell(
                  onTap: (){
                    setState(() {
                      widget.model.isDone = !widget.model.isDone;
                    });


                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                          color: widget.model.isDone==false? MyThemeData.primaryColor :Color(0xff61E757),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
