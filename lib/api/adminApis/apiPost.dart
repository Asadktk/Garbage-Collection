import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:http/http.dart' as http;

class AdminApiPost {
//Add Package Post Function
  // ignore: non_constant_identifier_names
  static Future AddPackages(
      {Package_name, Recycle_bag, Nonrecycle_bag, price, context}) async {
    http.Response response;
    response = await http
        .post(Uri.parse("http://${LoginApi.mainIP}/Fyp1api/api/Admin/Addpkg"),
            body: jsonEncode(<String, String>{
              'Package_name': Package_name,
              'Recycle_bag': Recycle_bag,
              'Nonrecycle_bag': Nonrecycle_bag,
              'price': price,
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

//Add Block Post Functio
  static Future AddBlock({City, Area, Block_name, context}) async {
    http.Response response;
    response = await http
        .post(Uri.parse("http://${LoginApi.mainIP}/Fyp1api/api/Admin/Addblock"),
            body: jsonEncode(<String, String>{
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

//Add Vehicle Post Functio
  // ignore: non_constant_identifier_names
  static Future AddVehicle({city, Vehicle_name, Vehicle_regno, context}) async {
    http.Response response;
    response = await http.post(
        Uri.parse("http://${LoginApi.mainIP}/Fyp1api/api/Admin/Addvehicle"),
        body: jsonEncode(<String, String>{
          'Vehicle_name': Vehicle_name,
          'Vehicle_regno': Vehicle_regno,
          'City': city
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

  //Generate token
  Future<dynamic> postGenerateToken(
    upId,
    recycleBag,
    nonrecycleBag,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://${LoginApi.mainIP}/Fyp1api/api/Admin/GenerateTokens'));
      request.body = json.encode({
        // "User_id": int.parse(userId),
        "Up_id": int.parse(upId),
        "Recycle_bag": int.parse(recycleBag),
        "Nonrecycle_bag": int.parse(nonrecycleBag),
        // 'Token_no': TokenNo
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("dataRespose ${await response.stream.bytesToString()}");
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  //Set Bock Schedule
  // ignore: non_constant_identifier_names
  static Future setBlockSchedule({Shift, Block_id, context}) async {
    http.Response response;
    response = await http.post(
        Uri.parse(
            "http://${LoginApi.mainIP}/Fyp1api/api/AdminContinue/SetBlockSchedule?Shift=$Shift&Block_id=$Block_id"),
        body: jsonEncode(<String, String>{
          'Shift': Shift,
          'Block_id': Block_id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "${response.body}", backgroundColor: Colors.black);
      jsonDecode(response.body);

      print(response.body);
    }
  }
}
