import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/card_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../splash.dart';
import 'driver_aply_for_leave.dart';
import 'driver_working_area.dart';

class DriverDashBoard extends StatefulWidget {
  const DriverDashBoard({Key? key}) : super(key: key);

  @override
  State<DriverDashBoard> createState() => _DriverDashBoardState();
}

class _DriverDashBoardState extends State<DriverDashBoard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              width: width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 20),
                    child: Icon(
                      Icons.menu,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  InkWell(
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      var role1 = pref.getString('Utype');
                      await pref.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    child: const Image(
                      image: AssetImage('assets/user_profile.png'),
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 0)
                ],
              ),
            ),
            textWidget(
                title: "Driver DashBoard",
                fsize: 30.0,
                fweight: FontWeight.w500,
                color: Colors.black),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverWorkingArea()),
                  ),
                  child: CardWidget(
                    width: width * 0.5,
                    height: height * 0.2,
                    image: 'assets/report.png',
                    text: "My Working Area",
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DriverApplyForLeave())),
                  child: CardWidget(
                    width: width * 0.5,
                    height: height * 0.2,
                    image: 'assets/report.png',
                    text: "Apply For Leave",
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     InkWell(
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const GarbageRequest()),
            //       ),
            //       child: CardWidget(
            //         width: width * 0.5,
            //         height: height * 0.2,
            //         image: 'assets/packages.png',
            //         text: "Garbage Request",
            //       ),
            //     ),
            //     // InkWell(
            //     //   onTap: () {
            //     //     Navigator.push(
            //     //       context,
            //     //       MaterialPageRoute(
            //     //           builder: (context) => const UserComplaints()),
            //     //     );
            //     //   },
            //     //   // child: CardWidget(
            //     //   //   width: width * 0.5,
            //     //   //   height: height * 0.2,
            //     //   //   image: 'assets/report.png',
            //     //   //   text: "My Complaints",
            //     //   // ),
            //     // ),
            //   ],
            // ),
          ],
        ),
      )),
    );
  }
}
