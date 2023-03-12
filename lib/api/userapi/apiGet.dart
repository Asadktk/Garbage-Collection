import 'dart:convert';

import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApiGetRequest {
  //User My Packages
  Future<dynamic> getmyPackages() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic responceJson;
    try {
      var userId = prefs.getString('User_id');
      print("User id is: $userId");
      final response = await http.get(Uri.parse(
          "http://${LoginApi.mainIP}/Fyp1api/api/User/Mypkg?uid=$userId"));
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

  //User GarbageRequest Status
  Future<dynamic> getUserGarbageRequestStatus({var userid}) async {
    dynamic responceJson;
    try {
      final response = await http.get(Uri.parse(
          "http://${LoginApi.mainIP}/Fyp1api/api/User/MyGarbageRequestStatus?User_id=$userid"));
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

  //User My Token
  Future<dynamic> getUserMyToken({var userid}) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic responceJson;
    try {
      final response = await http.get(Uri.parse(
        "http://${LoginApi.mainIP}/Fyp1api/api/User/Mytokens?User_id=$userid",
      ));

      var data = jsonDecode(response.body.toString());
      var Token_no = data[0]['Token_no'];

      prefs.setString(
        "Token_no",
        Token_no,
      );
      print('Code :: ${response.statusCode}');
      print('data $data');
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      throw e;
    }
  }
}
