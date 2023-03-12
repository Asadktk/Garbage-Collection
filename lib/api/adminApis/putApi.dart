import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../SignupLogin/login.dart';

class AdminApiPut {
//   Future<AllComplaintModel> updateAlbum(String Cid) async {
//   final response = await http.put(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/$Cid'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'Cid': int.parse(Cid),
//     }),
//   );

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return AllComplaintModel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to update album.');
//   }
// }

  Future<dynamic> updateComplaint({var Cid}) async {
    print("Complaint Id $Cid");
    var request = http.Request(
        'PUT',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/acceptComplaints?Cid=$Cid'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Complaints Accepted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

  // All Accept Garbage Request from Collector Side
  Future<dynamic> acceptGarbagerequest({var GarbageId}) async {
    print("Complaint Id $GarbageId");
    var request = http.Request(
        'PUT',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/AcceptGarbageRequest?Garbage_id=$GarbageId'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Garbage Request Accepted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

// All User Accept Request
  static Future userAcceptRequest(
      {User_id, City, Area, Block_name, context}) async {
    http.Response response;
    response = await http.put(
        Uri.parse(
            "http://${LoginApi.mainIP}/Fyp1api/api/Admin/Useracceptrequest"),
        body: jsonEncode(<String, String>{
          'User_id': User_id,
          'City': City,
          'Area': Area,
          'Block_name': Block_name,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      print(response.body);
    }
  }

  // All User Accept Request
  static Future userAcceptLeaveRequest(
      {User_id, City, Area, Block_name, context}) async {
    http.Response response;
    response = await http.put(
        Uri.parse(
            "http://${LoginApi.mainIP}/Fyp1api/api/Admin/Useracceptrequest"),
        body: jsonEncode(<String, String>{
          'User_id': User_id,
          'City': City,
          'Area': Area,
          'Block_name': Block_name,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      print(response.body);
    }
  }
}
