import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Timer(Duration (seconds: 5), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      body: Stack(
       alignment: Alignment.bottomCenter,
        children: [
          Center(child: Image(image: AssetImage("assets/images/logo.png"),width: 189,height: 211,)),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("supervised by Mohamed Hamouda",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff3598DB)
            )),
          ),

        ],
      ),
    );
  }
}
