import 'package:flutter/material.dart';
import 'package:to_do_app/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/themeData.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'my_provider/provider.dart';

void main (){
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MyApp ()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(provider.langCode),
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      themeMode: provider.mood,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
        Home.routeName:(context) => Home(),
      },


    );
  }
}

