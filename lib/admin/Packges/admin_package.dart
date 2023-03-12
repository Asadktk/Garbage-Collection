import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Packges/admin_add_package.dart';
import 'package:garbage_collection/admin/Packges/admin_update_package.dart';
import 'package:garbage_collection/widgets/admin_card.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/admin_packages.dart';
import '../../widgets/admin_package_card.dart';

class AdminPackge extends StatefulWidget {
  const AdminPackge({Key? key}) : super(key: key);
  @override
  State<AdminPackge> createState() => _PackagesState();
}

// PackgeController? _con;
PackgeController _con = PackgeController();

class _PackagesState extends State<AdminPackge> {
  // @override
  // void initState() {
  //   super.initState();

  //   _con?.getAdminPackges;
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/third.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                width: width * 0.95,
                // color: Colors.amber,
                //appbar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      onPressed: () => Navigator.of(context).pop(null),
                    ),
                    textWidget(
                        title: 'All Admin Packges',
                        fsize: 30.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                    Container(),
                  ],
                ),
              ),
              //column children
              Center(
                child: Container(
                  // color: Colors.amber,
                  width: width * 0.90,
                  height: height * 0.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        FutureBuilder(
                            future: _con.adminPackagesListController(),
                            builder: (context,
                                AsyncSnapshot<List<AdminPackages>> snapshot) {
                              if (!snapshot.hasData) {
                                return Text("Loading...!");
                              } else {
                                List<AdminPackages> data = snapshot.data!;
                                // List<AdminPackge> data = snapshot.data!;
                                return Container(
                                  //color: Color.fromARGB(255, 76, 74, 74),
                                  height: height * 0.6,
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AdminPackageCard(
                                          txtname: '${data[index].packageName}',
                                          txtcity:
                                              'Recycler: ${data[index].recycleBag}',
                                          txtarea:
                                              'Non-Recycler: ${data[index].nonrecycleBag}',
                                          txtblock:
                                              'Price: ${data[index].price}',
                                          context: context,
                                          width: width * 1.6,
                                          height: height * 0.2,
                                          fsize: 18.0,
                                          txtColor: Colors.black,
                                        );
                                      }),
                                );
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddPackage()),
                                );
                              },
                              child: button(
                                title: "Add Package",
                                width: width * 0.8,
                                height: height * 0.06,
                                fsize: 16.0,
                                bgColor: Color.fromARGB(255, 40, 172, 53),
                                txtColor: Colors.black,
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const UpDatePackage()),
                            //     );
                            //   },
                            //   child: button(
                            //     title: "Update Package",
                            //     width: width * 0.37,
                            //     height: height * 0.06,
                            //     fsize: 16.0,
                            //     bgColor: Color.fromARGB(255, 164, 231, 7),
                            //     txtColor: Colors.white,
                            //   ),
                            // ),

                            // button(
                            //   title: "Remove Package",
                            //   width: width * 0.37,
                            //   height: height * 0.06,
                            //   fsize: 16.0,
                            //   bgColor: Color.fromARGB(255, 246, 88, 88),
                            //   txtColor: Colors.white,
                            // ),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Future getPackges() async {
//   http.Response response;
//   response = await http.post(
//       Uri.parse("http://192.168.56.1/Fyp1api/api/Admin/Allpackages"),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       });
//   if (response.statusCode == 200) {
//     jsonDecode(response.body);
//     print(response.body);
//   }
// }

// Future<Object> adminPackages() async {
//   final response = await http
//       .get(Uri.parse("http://192.168.56.1/Fyp1api/api/Admin/Allpackages"));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     // ignore: unused_local_variable
//     // for (Map i in data) {
//     //   packageList.add(AdminPackages.fromJson(i));
//     // }
//     print(data);
//     return AdminPackages.fromJson(data);
//   } else {
//     print(data);
//     return data;
//   }
// }
