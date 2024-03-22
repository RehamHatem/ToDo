import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/themeData.dart';

import '../language.dart';
import '../mood.dart';
import '../my_provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 70,
          padding: EdgeInsets.only(left: 18, top: 14),
          decoration: BoxDecoration(
            color: MyThemeData.primaryColor,
          ),
          child: Text(
            "${AppLocalizations.of(context)!.set}",
            style: prov.mood == ThemeMode.light
                ? MyThemeData.dark.textTheme.bodyMedium
                : MyThemeData.light.textTheme.bodyMedium
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppLocalizations.of(context)!.lang}",
                style: prov.mood == ThemeMode.light
                    ? MyThemeData.light.textTheme.bodyMedium
                    : MyThemeData.dark.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return LanguageSheet();
                        },
                        isDismissible: false);
                  },
                  child: Container(
                    height: 48,
                    width: 318,
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: MyThemeData.primaryColor, width: 2)),
                    child: Text(
                      "${AppLocalizations.of(context)!.en}",
                      style:  MyThemeData.light.textTheme.bodySmall
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("${AppLocalizations.of(context)!.mode}",
                  style: prov.mood == ThemeMode.light
                      ? MyThemeData.light.textTheme.bodyMedium
                      : MyThemeData.dark.textTheme.bodyMedium,),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MoodSheet();
                      },
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 318,
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: MyThemeData.primaryColor, width: 2)),
                    child: Text("${AppLocalizations.of(context)!.light}",
                        style: MyThemeData.light.textTheme.bodySmall),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
