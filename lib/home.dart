import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/taps/list.dart';
import 'package:to_do_app/taps/update.dart';
import 'package:to_do_app/task_bottom_sheet.dart';
 import 'package:to_do_app/taps/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/themeData.dart';

import 'my_provider/provider.dart';
class Home extends StatefulWidget {
  static const String routeName = "home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: pro.mood==ThemeMode.light? MyThemeData.bgColor:MyThemeData.bgDarkColor,
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("${AppLocalizations.of(context)!.appName}",
          ),
        ),
        body: tabs[index],
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: TaskModelSheet());
                },
              );
            },
            child: Icon(Icons.add,),

            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,

          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },

            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_list.png"),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage(
                        "assets/images/icon_settings.png",
                      ),
                     ),
                  label: ""),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    ToDoList(),
    Settings(),
    UpdateTask()
  ];
}
