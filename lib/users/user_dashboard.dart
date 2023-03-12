import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Drawer/user_drawer.dart';
import '../splash.dart';
import '../widgets/card_widgets.dart';
import '../widgets/text.dart';
import 'Complaint/add_complaint.dart';
import 'Packages/my_packages.dart';
import 'Packages/user_packages.dart';
import 'Request/garbage_request.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

var User_name;

class _UserDashBoardState extends State<UserDashBoard> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // _con.getAdminPackagesList();
    GetType();
    super.initState();
  }

  // ignore: non_constant_identifier_names
  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      User_name = pref.getString('User_name');
      // print(Utype);
      print(User_name);
    });
  }

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
        drawer: SizedBox(
            width: width * 0.6,
            child: const Drawer(
              child: UserDrawer(),
            )),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 20),
                      child: InkWell(
                        onTap: () => _scaffold.currentState!.openDrawer(),
                        child: const Icon(
                          Icons.menu,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    textWidget(
                        title: 'welcome ${User_name}',
                        fsize: 20.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                    InkWell(
                      onTap: () async {
                        final pref = await SharedPreferences.getInstance();
                        var role1 = pref.getString('Utype');
                        await pref.clear();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()),
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/user_profile.png'),
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              textWidget(
                  title: "User DashBoard",
                  fsize: 30.0,
                  fweight: FontWeight.w500,
                  color: Colors.black),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyPackages()),
                    ),
                    child: CardWidget(
                      width: width * 0.5,
                      height: height * 0.2,
                      image: 'assets/package.png',
                      text: "My Packge",
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserPackge())),
                    child: CardWidget(
                      image: 'assets/product.png',
                      text: "Packages",
                      width: width * 0.5,
                      height: height * 0.2,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     CardWidget(
              //       width: width * 0.5,
              //       height: height * 0.2,
              //       image: 'assets/tokens.png',
              //       text: "Tokens",
              //     ),
              //     CardWidget(
              //       width: width * 0.5,
              //       height: height * 0.2,
              //       image: 'assets/report.png',
              //       text: "Register Complaints",
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GarbageRequest()),
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
                            builder: (context) => const UserComplaints()),
                      );
                    },
                    child: CardWidget(
                      width: width * 0.5,
                      height: height * 0.2,
                      image: 'assets/report.png',
                      text: "My Complaints",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
