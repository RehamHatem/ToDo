import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/auth/signin.dart';
import 'package:to_do_app/themeData.dart';

import '../my_provider/provider.dart';
import '../my_provider/user_provider.dart';
import 'login.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName="auth";
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    var prov = Provider.of<userprovider>(context);

    return Container(
      decoration: BoxDecoration(
        color: pro.mood==ThemeMode.light? MyThemeData.bgColor:MyThemeData.bgDarkColor,

      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "${AppLocalizations.of(context)!.login}"),
                Tab(text: "${AppLocalizations.of(context)!.signin}"),

              ],
            ),
            title: Text("${AppLocalizations.of(context)!.auth}"),
          ),
          body: TabBarView(
            children: [
              LogIn(),
              SignIn()
            ],
          ),
        ),
      ),
    );
  }
}
