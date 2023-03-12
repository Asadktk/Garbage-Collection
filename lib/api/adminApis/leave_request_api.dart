import 'dart:convert';

import 'package:http/http.dart' as http;

import '../SignupLogin/login.dart';

class LeaveRequestApi {
  static Future staffAplyForLeave({id, context, data}) async {
    http.Response response;
    response = await http.post(
        Uri.parse(
            "http://${LoginApi.mainIP}/Fyp1api/api/Driver/Applyforleave?User_id=$id"),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': 'application/json',
        });
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      print(response.body);
    }
  }
}
