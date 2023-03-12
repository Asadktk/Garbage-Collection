import 'package:flutter/material.dart';
import 'package:garbage_collection/splash.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);
  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

var User_name;
var Email;

class _UserDrawerState extends State<UserDrawer> {
  void initState() {
    // _con.getAdminPackagesList();
    GetType();
    super.initState();
  }

  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      User_name = pref.getString('User_name');
      Email = pref.getString('Email');
      // print(Utype);
      print(User_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.green,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 171, 244, 93),
              ),
              accountName: textWidget(
                  title: "${User_name}",
                  fsize: 24.0,
                  fweight: FontWeight.bold,
                  color: Colors.black),
              accountEmail: textWidget(
                  title: "${Email}",
                  fsize: 20.0,
                  fweight: FontWeight.w400,
                  color: Colors.black),
              //currentAccountPictureSize: Size.square(100),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "A",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 123, 139, 239)),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text(' Log Out '),
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                var role1 = pref.getString('Utype');
                print(role1);

                await pref.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
