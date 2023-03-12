import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Block/all_block.dart';
import 'package:garbage_collection/admin/Package_Request/package_request.dart';
import 'package:garbage_collection/admin/Packges/admin_package.dart';
import 'package:garbage_collection/admin/Collector/all_collector.dart';
import 'package:garbage_collection/admin/Complaints/all_complaints.dart';
import 'package:garbage_collection/admin/Driver/all_drivers.dart';
import 'package:garbage_collection/admin/Vehicles/all_vehicles.dart';
import 'package:garbage_collection/admin/User/all_user.dart';
import 'package:garbage_collection/widgets/card_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';

import '../../Drawer/admin_drawer.dart';
import '../SataffLeave/staf_leave_history.dart';
import '../SataffLeave/staff_leave.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

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
            key: _scaffold,
            drawer: Container(
                width: width * 0.6,
                child: Drawer(
                  child: drawerView(),
                )),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    width: width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => _scaffold.currentState!.openDrawer(),
                          child: const Icon(
                            Icons.menu,
                            size: 40,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/user_profile.png'),
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  textWidget(
                      title: "Admin DashBoard",
                      fsize: 30.0,
                      fweight: FontWeight.w500,
                      color: Colors.black),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PackageRequest()),
                        ),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: CardWidget(
                            image: 'assets/packages.png',
                            text: "All Request",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllCollector()),
                        ),
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            child: CardWidget(
                              image: 'assets/collectors.png',
                              text: "Collectors",
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllDrivers()),
                        ),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: CardWidget(
                            image: 'assets/drivers.png',
                            text: "Drivers",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminPackge()),
                        ),
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            child: CardWidget(
                              image: 'assets/packages.png',
                              text: "Packages",
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllVehicles()),
                        ),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: CardWidget(
                            image: 'assets/schedules.png',
                            text: "Vehcles",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllCompaints()),
                        ),
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            child: CardWidget(
                              image: 'assets/complaints.png',
                              text: "Complaints",
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllBlock()),
                        ),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: CardWidget(
                            image: 'assets/drivers.png',
                            text: "Blocks",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllUser()),
                        ),
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            child: CardWidget(
                              image: 'assets/users.png',
                              text: "All User",
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffLeaveRequest()),
                        ),
                        child: Container(
                          width: width * 0.5,
                          height: height * 0.2,
                          child: CardWidget(
                            image: 'assets/drivers.png',
                            text: "Staff Leave",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StaffLeaveHistory()),
                        ),
                        child: Container(
                            width: width * 0.5,
                            height: height * 0.2,
                            child: CardWidget(
                              image: 'assets/users.png',
                              text: "Staf Leave History",
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
