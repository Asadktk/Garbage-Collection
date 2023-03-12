// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:http/http.dart';

import '../../admin/Dashboard/admin_dashboard.dart';
import '../../users/SignupLogin/signin.dart';

// ignore: non_constant_identifier_names
void Register(
    {Name,
    Username,
    Email,
    Phoneno,
    Pasword,
    Street,
    city,
    area,
    HouseNo,
    Utype,
    long,
    lat,
    context}) async {
  try {
    Response response = await post(
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/User/Signup?City=$city&Area=$area'),
        body: {
          'Name': Name,
          'User_name': Username,
          'Email': Email,
          'Phone_no': Phoneno,
          'Pasword': Pasword,
          'Street': Street,
          'House_no': HouseNo,
          "Utype": Utype,
          "Longitude": long,
          "Latitude": lat,
        });
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
      print(data);
      print("Account Created Successfully");
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
}

// Future<String> signupApis({
//   // ignore: non_constant_identifier_names
//   user_name,
//   email,
//   password,
//   street,
//   // ignore: non_constant_identifier_names
//   house_no,
//   context,
// }) async {
//   // isloading:true;
//   var apiURL = 'http://192.168.56.1/api/auth/register';

//   var formData = FormData.fromMap({
//     'user_name': user_name,
//     'email': email,
//     'password': password,
//     'house_no': house_no,
//     'street': street,
//     'house_no': house_no,
//   });
//   //final prefs = await SharedPreferences.getInstance();

//   Dio dio = Dio();
//   Response responce;
//   try {
//     responce = await dio.post(
//       apiURL,
//       data: formData,
//     );
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const UserDashBoard()),
//     );
//     return responce.data;
//   } catch (e) {
//     Fluttertoast.showToast(
//         msg: "User Already exists ", backgroundColor: Colors.cyan);
//     return "";
//   }
// }
