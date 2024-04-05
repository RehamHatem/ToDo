import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/Authentication.dart';
import 'package:to_do_app/themeData.dart';

import 'home.dart';
import 'my_provider/provider.dart';
import 'my_provider/user_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration (seconds: 5), () {
  //     var prov = Provider.of<userprovider>(context,listen: false);
  //     Navigator.pushReplacementNamed(context,prov.firebaseUser!=null ?Home.routeName:AuthScreen.routeName);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    var prov = Provider.of<userprovider>(context,listen: false);

    Timer(Duration(seconds: 5), () {
      // Navigate based on authentication state
      if (prov.firebaseUser != null) {
        // If user is logged in, navigate to home screen
        Navigator.pushReplacementNamed(context, Home.routeName);
      } else {
        // If user is not logged in, navigate to authentication screen
        Navigator.pushReplacementNamed(context, AuthScreen.routeName);
      }
    });

    return Scaffold(
      backgroundColor: pro.mood == ThemeMode.light?MyThemeData.bgColor:MyThemeData.bgDarkColor,
      body: Stack(
       alignment: Alignment.bottomCenter,
        children: [
          Center(child: Image(image: AssetImage("assets/images/logo.png"),width: 189,height: 211,)),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("supervised by Mohamed Hamouda",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color:  MyThemeData.primaryColor
            )),
          ),

        ],
      ),
    );
  }
}
