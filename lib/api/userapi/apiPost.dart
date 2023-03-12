import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/api/SignupLogin/login.dart';
import 'package:http/http.dart' as http;

class UserApiPost {
  // User Post Resquest for Approve packge
  // static Future PostPackageRequest(
  //     {Package_name, Recycle_bag, Nonrecycle_bag, price, context}) async {
  //   http.Response response;
  //   response = await http
  //       .post(Uri.parse("http://192.168.56.1/Fyp1api/api/Admin/Addpkg"),
  //           body: jsonEncode(<String, String>{
  //             'Package_name': Package_name,
  //             'Recycle_bag': Recycle_bag,
  //             'Nonrecycle_bag': Nonrecycle_bag,
  //             'price': price,
  //           }),
  //           headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       });
  //   if (response.statusCode == 200) {
  //     jsonDecode(response.body);
  //     print(response.body);
  //   }
  // }

  Future<dynamic> postUserPackge(packgeID, userId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/User/Subscribepkg'));
    request.body = json.encode(
        {"User_id": int.parse(userId), "Package_id": int.parse(packgeID)});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("dataRespose ${await response.stream.bytesToString()}");
    } else {
      print(response.reasonPhrase);
    }
  }

  // User Send Garbage request
  Future<dynamic> sendUserGarbageRequest({userId}) async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://${LoginApi.mainIP}/Fyp1api/api/User/SendGarbageRequest?User_id=$userId'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Fluttertoast.showToast(
            msg: "Request sended",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

//User Send Complaints
  Future<dynamic> sentUserComplaint(userId, complaint, Qty, date) async {
    print('Complaint ${complaint}');
    print('Quantity ${Qty}');
    print('Date ${date}');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    try {
      var response = await http.post(
        Uri.parse('http://${LoginApi.mainIP}/Fyp1api/api/User/Sendcomplaint'),
        body: jsonEncode({
          "User_id": int.parse(userId),
          "Complaint": '$complaint',
          "Qty": '$Qty',
          "date": '$date'
        }),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        // print(await response.body());
        Fluttertoast.showToast(
            msg: "Complaint Send Succesfulyy sended",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print(response.reasonPhrase);
      }
      print(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
