import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserPutApi {
  Future<dynamic> userMissingToken({var uid}) async {
    var request = http.Request(
        'PUT',
        Uri.parse(
            'http://192.168.56.1/Fyp1api/api/User/Missingtokens?User_id=$uid'));

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
}
