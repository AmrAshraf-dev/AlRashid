// import 'package:alrashid_mall_app/locale/locale.dart';
// import 'package:flutter/material.dart';
//
// class Bill extends StatelessWidget {
//   const Bill({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final mywidth = MediaQuery.of(context).size.width;
//     final myheight = MediaQuery.of(context).size.height;
//     var locale = AppLocalizations.of(context);
//     return Scaffold(
//       body: ListView(
//         children: [
//           ListTile(
//             leading: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: const Icon(
//                 Icons.clear,
//                 size: 30.0,
//                 color: Color(0xff333333),
//               ),
//             ),
//             title: Center(
//               child: Text(
//                 locale!.yourBill!,
//                 style: const TextStyle(
//                   color: Color(0xff333333),
//                   fontFamily: ('DINNextLTArabic'),
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//           // const SizedBox(
//           //   height: 20.0,
//           // ),
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 30.0),
//             child: Container(
//               width: 300,
//               height: 800,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: SizedBox(
//                       // margin: EdgeInsets.only(bottom: myheight * 0.99),
//                       height: 120,
//                       width: 120,
//                       child: Stack(
//                         //   alignment: AlignmentDirectional.center,
//                         children: [
//                           Center(
//                             child: Container(
//                               width: 100,
//                               height: 100,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xFF00C853),
//                                 //color: Colors.green[400],
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Container(
//                               width: 85,
//                               height: 85,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 //color: Colors.green[300],
//                                 color: Color(0xFF00c781),
//                               ),
//                               child: const Icon(
//                                 Icons.check_rounded,
//                                 color: Colors.white,
//                                 size: 60.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 30,
//                     height: 40,
//                     //padding: EdgeInsets.only(top: 30),
//                     child: Image.asset(
//                       'assets/images/ground_floor/ground1.png',
//                       // width: 30,
//                       // height: 60,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: 30,
//                     height: 40,
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Image.asset(
//                       'assets/images/ground_floor/ground60-removebg-preview.png',
//                       //  width: 30,
//                       //height: 30,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: 30,
//                     height: 40,
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Image.asset(
//                       'assets/images/ground_floor/ground60-removebg-preview.png',
//                       // width: 30,
//                       //  height: 30,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: 30,
//                     height: 40,
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Image.asset(
//                       'assets/images/ground_floor/ground60-removebg-preview.png',
//                       // width: 30,
//                       //  height: 30,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
