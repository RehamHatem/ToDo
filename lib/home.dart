import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/taps/list.dart';
import 'package:to_do_app/task_bottom_sheet.dart';
// import 'package:to_do_app/taps/setting.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffDFECDB),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xff5D9CEC),
          elevation: 0,
          title: Text("To Do List",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              )),
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
            child: Icon(Icons.add, size: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white, width: 4)),
            elevation: 0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          padding: EdgeInsets.zero,
          color: Colors.white,
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xff5D9CEC),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_list.png"),
                      size: 30),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage(
                        "assets/images/icon_settings.png",
                      ),
                      size: 30),
                  label: ""),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    ToDoList(),
    // Settings(),
  ];
}
