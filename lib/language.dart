
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(32.0),
           child: Row(
             children: [
               Text("English",style: GoogleFonts.inter(
                   fontSize: 22,
                   fontWeight: FontWeight.w400,
                   color: Color(0xff5D9CEC)
               )),
               Spacer(),

               Icon(Icons.check,size: 30,color:Color(0xff5D9CEC) ,)
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(32.0),
           child: Row(
             children: [
               Text("Arabic",style: GoogleFonts.inter(
                   fontSize: 22,
                   fontWeight: FontWeight.w400,
                   color: Colors.black
               )),
               Spacer(),
               Icon(Icons.check,size: 30,)
             ],
           ),
         ),
       ],
    );
  }
}
