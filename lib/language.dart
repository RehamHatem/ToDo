
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/my_provider/provider.dart';
import 'package:to_do_app/themeData.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(32.0),
           child: Row(
             children: [
               InkWell(
                 onTap: () {
                   prov.changeLang("en");
                 },
                 child: Text("${AppLocalizations.of(context)!.en}",style: GoogleFonts.inter(
                     fontSize: 22,
                     fontWeight: FontWeight.w400,
                     color: MyThemeData.primaryColor
                 )),
               ),
               Spacer(),

                Icon(Icons.check ,color: prov.langCode=="en"? MyThemeData.primaryColor : Colors.transparent ,)
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(32.0),
           child: Row(
             children: [
               InkWell(
                   onTap: () {
                     prov.changeLang("ar");
                   },
                   child: Text("${AppLocalizations.of(context)!.ar}",style: MyThemeData.light.textTheme.bodySmall)),
               Spacer(),
               Icon(Icons.check ,color: prov.langCode=="ar"? MyThemeData.primaryColor : Colors.transparent ,)


             ],
           ),
         ),
       ],
    );
  }
}
