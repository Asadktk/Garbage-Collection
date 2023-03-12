import 'dart:async';
import 'package:flutter/material.dart';
import 'package:garbage_collection/users/SignupLogin/signin.dart';
import 'package:garbage_collection/users/user_dashboard.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Collector/collector_dashboard.dart';
import 'Driver/driver_dashboard.dart';
import 'admin/Dashboard/admin_dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var Utype;
var UserId;

class _MyHomePageState extends State<SplashScreen> {
  // ignore: non_constant_identifier_names
  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Utype = pref.getString('Utype');
      UserId = pref.getString('User_id');
      print(Utype);
      print(UserId);
    });
  }

  @override
  void initState() {
    super.initState();
    GetType();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
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
              return SignIn();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          SizedBox(
            height: 80,
          ),
          textWidget(
            title: "Garbage Collection",
            fsize: 30.0,
            fweight: FontWeight.bold,
            color: Colors.black,
          ),
          CircleAvatar(
            radius: 90,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/garbage.png',
            ),
          ),
          SizedBox(
            height: 39,
          ),
          button(
              title: 'SignIn',
              fsize: 25.0,
              txtColor: Colors.white,
              width: 340.0,
              height: 40.0,
              bgColor: Colors.green),
          SizedBox(
            height: 30.0,
          ),
          button(
              title: 'SignUp',
              fsize: 25.0,
              txtColor: Colors.white,
              width: 340.0,
              height: 40.0,
              bgColor: Colors.green),
          textWidget(
              title: '',
              fsize: 25.0,
              fweight: FontWeight.w500,
              color: Colors.black87)
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Garbage Collection")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
