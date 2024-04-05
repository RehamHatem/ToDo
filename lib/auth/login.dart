
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/fire_base.dart';

import '../home.dart';
import '../themeData.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                label: Text(
                "${AppLocalizations.of(context)!.email}",
          style: TextStyle(fontSize: 20),
        ),
      suffixIcon: Icon(Icons.email),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text(
                      "${AppLocalizations.of(context)!.pass}",
                      style: TextStyle(fontSize: 20),
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyThemeData.primaryColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            FirebaseFunctions.login(emailController.text, passwordController.text, (){
                              Navigator.pushNamedAndRemoveUntil(context, Home.routeName , (route) => false);
                            }, (message){
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text(message),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25)),
                                    actions: [
                                      Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Okay"),
                                            style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15))),backgroundColor: MaterialStatePropertyAll(MyThemeData.primaryColor)),
                                          ))
                                    ],
                                  );
                                },
                              );

                            });


                          }
                        },
                        child: Text(
                          "${AppLocalizations.of(context)!.login}",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),

                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),),
                      ))
                ),
              ),
            ],
          ),
        ),

    );
  }
}
