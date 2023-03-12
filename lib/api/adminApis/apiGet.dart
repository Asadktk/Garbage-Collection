import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/all_city_model.dart';

class AdminApiGetRequest {
  //All Packages User And Admin Side
  Future<dynamic> getadminPackages() async {
    dynamic responceJson;
    try {
      final response = await http.get(
          Uri.parse("http://${LoginApi.mainIP}/Fyp1api/api/Admin/Allpackages"));
      var data = jsonDecode(response.body.toString());
      print('Code :: ${response.statusCode}');
      print('data $data');
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw e;
    }
  }

// Get package Request
  Future<dynamic> getpackageRequest() async {
    try {
      final response = await http.get(Uri.parse(
          "http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllpkgRequests"));
      var data = jsonDecode(response.body.toString());
      print('Code :: ${response.statusCode}');
      print('data $data');
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw e;
    }
  }

  //Get All Vehicle
  Future<dynamic> getAllVehicle() async {
    try {
      var response = await http.get(
          Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/Allvehicles'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Collector
  Future<dynamic> getAllCollector() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllCollector'));
      var data = jsonDecode(response.body.toString());
      print('io ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Driver
  Future<dynamic> getAllDriver() async {
    try {
      var response = await http.get(
          Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllDriver'));
      var data = jsonDecode(response.body.toString());
      print('io ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Pending
  Future<dynamic> getAllPendingUser() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/Allpendingusers'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All User
  Future<dynamic> getAllUser() async {
    try {
      var response = await http.get(
          Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/Allusers'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get all City Dropdown
  Future<dynamic> getCity() async {
    var response = await http
        .get(Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/getCity'));
    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      // print(response.body);
      // response = jsonDecode(response.body.toString());
      return jsonDecode(response.body);
      // GetCityModel data = GetCityModel.fromJson(response.body.toS);
    }
  }

  //Get all Area Dropdown
  Future<dynamic> getArea({city}) async {
    var response = await http.get(Uri.parse(
        'http://${LoginApi.mainIP}/Fyp1api/api/Admin/getArea?city=$city'));

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      //    print(response.body);
      // response = jsonDecode(response.body.toString());
      return jsonDecode(response.body);
      // GetCityModel data = GetCityModel.fromJson(response.body.toS);
    }
  }

  //Get All Block
  Future<dynamic> getAllBlock() async {
    try {
      var response = await http.get(
          Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/Allblocks'));
      var data = jsonDecode(response.body.toString());
      print('io ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Complaints
  Future<dynamic> getAllComplaint() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllUsersComplaints'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser Complaint ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Garbage Request
  Future<dynamic> getAllGarbageRequest() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllGarbageRequests'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
    // var request = http.Request(
    //     'GET',
    //     Uri.parse(
    //         'http://${LoginApi.mainIP}/Fyp1api/api/Admin/AllGarbageRequests'));

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
  }

//Get All Missing Token
  Future<dynamic> getAllMissingToken() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/Missingtokenscomplaints'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All User Assign Block
  Future<dynamic> getAllAssignBlockForUser({Area, City}) async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/Getblock?city=$City&area=$Area'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get schedule Block list
  Future<dynamic> getScheduleBlockList() async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/AdminContinue/Getscheduledblock'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  //Get All Day For Block
  Future<dynamic> getDayForblock({Day, Area, City}) async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/AdminContinue/GetBlockSchedule?Day=$Day&City=$City&Area=$Area'));
      var data = jsonDecode(response.body.toString());
      print('Days For ${data}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "$data", backgroundColor: Colors.black);
        print("object $response");
        if (data.contains('re assign block')) {}
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> getAllUserMapdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var User_id = pref.getString("User_id");
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.cell}/Fyp1api/api/Driver/usersgetlocation?User_id=$User_id'));

      // print('Days For ${data}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('responce ${response.body}');
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> getBlockData({block_id, day}) async {
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/AdminContinue/Scheduledblocks?Block_id=$block_id&Day=$day'));

      // print('Days For ${data}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('responce ${response.body}');
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> getBlockDay({block_id}) async {
    try {
      print('apiEntry');
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/AdminContinue/Getscheduledblockdays?Block_id=6'));

      // print('Days For ${data}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('responce ${response.body}');
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

//Sttaf Leave
//Get All Garbage Request
  Future<dynamic> staffLeaveRequest() async {
    try {
      var response = await http.get(
          Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/Staffleaves'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${data}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<dynamic> staffHistoryLeaveRequest({userId}) async {
    print(
        '${'http://${LoginApi.mainIP}/Fyp1api/api/Driver/myleaveshistory?User_id=3'}');
    try {
      var response = await http.get(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Driver/myleaveshistory?User_id=3'));
      var data = jsonDecode(response.body.toString());
      print('pendinguser ${response.body}');

      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw (e.toString());
    }
  }
  // Future<dynamic> staffLeavehistory(userId) async {
  //   try {
  //     var response = await http.get(
  //         Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/Admin/Staffleaves'));

  //     // print('pendinguser ${data}');;
  //     if (response.statusCode == 200) {
  //       print('pendinguser ${response.body}');
  //       var data = jsonDecode(response.body.toString());
  //       return data;
  //     }
  //   } catch (e) {
  //     throw (e.toString());
  //   }
  // }

}
