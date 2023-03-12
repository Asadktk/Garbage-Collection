import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/card_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../splash.dart';
import 'all_garbage_request_collectorside.dart';
import 'collector_apply_for_leave.dart';
import 'collector_scantoken.dart';

class CollectorDashBoard extends StatefulWidget {
  const CollectorDashBoard({Key? key}) : super(key: key);

  @override
  State<CollectorDashBoard> createState() => _CollectorDashBoardState();
}

class _CollectorDashBoardState extends State<CollectorDashBoard> {
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
            Container(
              width: width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 20),
                    child: Icon(
                      Icons.menu,
                      size: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final pref = await SharedPreferences.getInstance();
                      var role1 = pref.getString('Utype');
                      await pref.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    child: Image(
                      image: AssetImage('assets/user_profile.png'),
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            textWidget(
                title: "Collector DashBoard",
                fsize: 30.0,
                fweight: FontWeight.w500,
                color: Colors.black),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollectorScanToken())),
                  child: CardWidget(
                    width: width * 0.5,
                    height: height * 0.2,
                    image: 'assets/tokens.png',
                    text: "Scan Tokens",
                  ),
                ),
                CardWidget(
                  width: width * 0.5,
                  height: height * 0.2,
                  image: 'assets/complaints.png',
                  text: "User Complaints",
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const GarbageRequestCollectorSide()),
                  ),
                  child: CardWidget(
                    width: width * 0.5,
                    height: height * 0.2,
                    image: 'assets/packages.png',
                    text: "Garbage Request",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CollectorApplyForLeave()),
                    );
                  },
                  child: CardWidget(
                    width: width * 0.5,
                    height: height * 0.2,
                    image: 'assets/report.png',
                    text: "Apply For Leave",
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
