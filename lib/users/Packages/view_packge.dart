// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class ViewPackge extends StatefulWidget {
//   const ViewPackge({Key? key}) : super(key: key);

//   @override
//   State<ViewPackge> createState() => _ViewPackgeState();
// }

// class _ViewPackgeState extends State<ViewPackge> {
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//     body:  Card(
//     shadowColor: Color.fromARGB(255, 38, 251, 5),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     color: Color.fromARGB(255, 236, 249, 217),
//     elevation: 5,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 10.0),
//           height: height * 0.3,
//           width: width * 0.9,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 10.0, left: 10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ignore: prefer_const_constructors
//                 Center(
//                   child: icon,
//                 ),

//                 textWidget(
//                     title: packagename,
//                     fsize: 27.0,
//                     fweight: FontWeight.bold,
//                     color: Colors.black),
//                 textWidget(
//                     title: recycler,
//                     fsize: 20.0,
//                     fweight: FontWeight.normal,
//                     color: Colors.black),
//                 textWidget(
//                     title: nonrecyler,
//                     fsize: 20.0,
//                     fweight: FontWeight.normal,
//                     color: txtColor),
//                 // textWidget(
//                 //     title: validate,
//                 //     fsize: 20.0,
//                 //     fweight: FontWeight.normal,
//                 //     color: Colors.black),
//                 textWidget(
//                     title: price,
//                     fsize: 20.0,
//                     fweight: FontWeight.normal,
//                     color: Colors.black),
//                 InkWell(
//                   onTap: () {
//                     print('button pressed');
//                   },
//                   child: button(
//                       title: buttontxt,
//                       width: width * 0.9,
//                       fsize: 21.0,
//                       height: height * 0.05,
//                       bgColor: Colors.green,
//                       txtColor: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
//       );
//   }
// }