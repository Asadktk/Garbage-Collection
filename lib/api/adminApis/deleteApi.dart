import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import '../SignupLogin/login.dart';
import 'package:http/http.dart' as http;

class AdminDeleteApi {
  // All Complaint Delete
  Future<dynamic> deleteComplaint({var Cid}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/removeComplaints?Cid=$Cid'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Complaints Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

// All Package Delete
  Future<dynamic> deletePackage({required String pname}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/Removepkg?Package_name=$pname'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Package Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

// Delete Pending User Request
  Future<dynamic> userDeleteRequest({id}) async {
    try {
      Response res = await delete(Uri.parse(
          'http://${LoginApi.mainIP}/Fyp1api/api/Admin/Removeuser?uid=$id'));
      String responseapi = res.body.toString().replaceAll("\n", "");
      var _data = jsonDecode(responseapi);
      print(_data);
      if (res.statusCode == 200) {
        print("Deleted");
      } else {
        throw "Sorry! Unable to delete this post.";
      }
    } catch (e) {
      print(e);
    }
  }

  // All Package Delete
  Future<dynamic> deleteVehicle({required String reg}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'http://192.168.56.1/Fyp1api/api/Admin/Removevehicle?Vehicle_regno=$reg'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Vehicle Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

  // All Garbage Request  Delete Collector Side
  Future<dynamic> deleteGarbageRequest({required int GRequest_id}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/RemoveGarbageRequests?Garbage_id=$GRequest_id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Garbage Request Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(response.reasonPhrase);
    }
  }

  // All package Request  Delete
  Future<dynamic> deletePackageRequest({required int PRequest_id}) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'http://${LoginApi.mainIP}/Fyp1api/api/Admin/RemovepkgRequests?Up_id=$PRequest_id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Fluttertoast.showToast(
          msg: "Package Request Deleted",
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
