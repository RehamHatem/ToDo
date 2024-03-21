// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../language.dart';
// import '../mood.dart';
//
// class Settings extends StatelessWidget {
//   const Settings({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: double.infinity,
//           height: 70,
//           padding: EdgeInsets.only(left: 18,top: 14),
//           decoration: BoxDecoration(
//             color: Color(0xff5D9CEC),
//           ),
//           child: Text("Settings",style: GoogleFonts.poppins(
//             fontWeight: FontWeight.w700,
//             fontSize: 22,
//             color: Colors.white
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Language",style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 22,
//                   color: Colors.black
//               )),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: InkWell(
//                   onTap: (){
//                     showModalBottomSheet(context: context, builder: (context) {
//                       return LanguageSheet();
//                     },isDismissible: false );
//                   },
//                   child: Container(
//                     height: 48,
//                       width: 318,
//                       padding: EdgeInsets.only(left: 16),
//                       alignment: Alignment.centerLeft,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Color(0xff5D9CEC),width: 2)
//
//                       ),
//                       child: Text("English",style: GoogleFonts.inter(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff5D9CEC)
//                       )),),
//                 ),
//               ),
//               SizedBox(height: 30),
//
//               Text("Mood",style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 22,
//                   color: Colors.black
//               )),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: InkWell(
//                   onTap: (){
//                     showModalBottomSheet(context: context, builder: (context) {
//                       return MoodSheet();
//                     },);
//                   },
//                   child: Container(
//                     height: 48,
//                     width: 318,
//                     padding: EdgeInsets.only(left: 16),
//                     alignment: Alignment.centerLeft,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Color(0xff5D9CEC),width: 2)
//
//                     ),
//                     child: Text("Light",style: GoogleFonts.inter(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff5D9CEC)
//                     )),),
//                 ),
//               ),
//
//             ],
//           ),
//         )
//
//
//       ],
//     );
//   }
// }
