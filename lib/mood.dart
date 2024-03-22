import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/themeData.dart';

import 'my_provider/provider.dart';

class MoodSheet extends StatelessWidget {
  const MoodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  pro.changemood(ThemeMode.light);
                },
                child: Text("${AppLocalizations.of(context)!.light}",style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: MyThemeData.primaryColor
                )),
              ),
              Spacer(),

              Icon(Icons.check,color: pro.mood==ThemeMode.light ?MyThemeData.primaryColor: Colors.transparent ,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    pro.changemood(ThemeMode.dark);
                  },
                  child: Text("${AppLocalizations.of(context)!.dark}",style: MyThemeData.light.textTheme.bodySmall)),
              Spacer(),
              Icon(Icons.check,color: pro.mood==ThemeMode.dark ?MyThemeData.primaryColor: Colors.transparent ,)
            ],
          ),
        ),
      ],
    );
  }
}
