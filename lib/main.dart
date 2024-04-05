import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/auth/Authentication.dart';
import 'package:to_do_app/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/taps/update.dart';
import 'package:to_do_app/themeData.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home.dart';
import 'my_provider/provider.dart';
import 'my_provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(
      MultiProvider(providers: [ChangeNotifierProvider<MyProvider>(create: (context) => MyProvider()),
  ChangeNotifierProvider<userprovider>(create: (context) => userprovider()),],
  child: MyApp(),
  ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var prov = Provider.of<userprovider>(context);

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
        SplashScreen.routeName: (context) => SplashScreen(),
        Home.routeName: (context) => Home(),
        UpdateTask.routeName: (context) => UpdateTask(),
        AuthScreen.routeName: (context) => AuthScreen(),
      },


    );
  }
}

