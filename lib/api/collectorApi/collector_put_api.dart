import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectorPutApi {
//   Future<dynamic> collectorScanToken({var token_no}) async {
//     print("Complaint Id $token_no");
//     var request = http.Request(
//         'PUT',
//         Uri.parse(
//             'http://${LoginApi.mainIP}/Fyp1api/api/Collector/GetToken?Token_no=$token_no'));
//     http.StreamedResponse response = await request.send();
//     response.stream.contains(token_no);
//     if (response.statusCode == 200) {
//       print("datatoke ${response.stream['']}");
//       Fluttertoast.showToast(
//           msg: "Token Scan Succesfully",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }

  static String Ether = '192.168.56.1';
  static String cell = '192.168.0.101';
  static String ayz = '192.168.43.155';
  static String mainIP = cell;
  // static int? User_id;
  Future<dynamic> collectorScanToken({var token_no}) async {
    // isloading:true;
    var apiURL =
        'http://${LoginApi.mainIP}/Fyp1api/api/Collector/GetToken?Token_no=$token_no';
    final prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response responce;
    try {
      responce = await dio.put(apiURL);
      if (responce.statusCode == 200) {
        if (responce.data.toString().contains(token_no)) {
          // print('reasponce${responce.data.toString()}');
          Fluttertoast.showToast(
              msg: "${responce.data.toString()}", backgroundColor: Colors.cyan);
          return responce.data;
        } else {
          Fluttertoast.showToast(
              msg: "Token already Scanned", backgroundColor: Colors.cyan);
          // msg: "Token already Scanned", backgroundColor: Colors.cyan);
        }
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "$e", backgroundColor: Colors.cyan);
      return '';
    }
    return '';
  }
}


// GetRole() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   var role = pref.getString('role');
//   return role;
// }
