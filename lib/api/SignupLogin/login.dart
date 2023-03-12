import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:garbage_collection/Collector/collector_dashboard.dart';
import 'package:garbage_collection/Driver/driver_dashboard.dart';
import 'package:garbage_collection/admin/Dashboard/admin_dashboard.dart';
import 'package:garbage_collection/users/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../users/SignupLogin/signin.dart';

class LoginApi {
  static String Ether = '192.168.56.1';
  static String cell = '192.168.170.142';
  static String ayz = ' 92.168.43.155';
  static String mainIP = cell;
  // static int? User_id;
  Future<String> loginApis({email, password, context}) async {
    // isloading:true;
    var apiURL = 'http://$mainIP/Fyp1api/api/User/Login';
    final prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response responce;

    try {
      responce = await dio.get(apiURL,
          queryParameters: {'User_name': email, 'Pasword': password}
          // data: formData,
          );
      var res1 = responce.data;
      // var token = res1['Utype'];
      var Utype = res1[0]['Utype'];
      var User_id = res1[0]['User_id'];
      var User_name = res1[0]['User_name'];
      var Email = res1[0]['Email'];
      print("user id $User_id");
      print("user id $Email");

      prefs.setString(
        "Utype",
        Utype,
      );
      prefs.setString(
        "User_id",
        User_id.toString(),
      );
      prefs.setString(
        "User_name",
        User_name.toString(),
      );
      prefs.setString(
        "Email",
        Email.toString(),
      );
      // print(token);
      // print(role);
      // var role1 = pref.getString('role');
      //  print(token);
      if (responce.statusCode == 200) {
        print("role $Utype");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            if (Utype == 'user') {
              return const UserDashBoard();
            } else if (Utype == 'Collector') {
              return const CollectorDashBoard();
            } else if (Utype == 'Driver') {
              return const DriverDashBoard();
            } else if (Utype == 'admin') {
              return const AdminDashBoard();
            }
            return const SignIn();
          }),
        );
        Fluttertoast.showToast(
            msg: "Login Successfull", backgroundColor: Colors.cyan);
        return 'Login Successfull';
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
