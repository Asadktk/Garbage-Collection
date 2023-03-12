import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garbage_collection/widgets/package_card.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/packges_controller.dart';
import '../../../Models/admin_packages.dart';

class UserPackge extends StatefulWidget {
  const UserPackge({Key? key}) : super(key: key);

  @override
  State<UserPackge> createState() => _PackagesState();
}

PackgeController _con = PackgeController();
var UserId;

class _PackagesState extends State<UserPackge> {
  @override
  void initState() {
    _con.adminPackagesListController();
    GetType();
    super.initState();
  }

  // ignore: non_constant_identifier_names
  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      UserId = pref.getString('User_id');
      // print(Utype);
      print(UserId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/fourth.jpg',
                ),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pop(null),
                              ),
                              textWidget(
                                  title: 'All Packges',
                                  fsize: 30.0,
                                  fweight: FontWeight.w500,
                                  color: Colors.black),
                              Container(),
                            ],
                          ),
                          FutureBuilder(
                              future: _con.adminPackagesListController(),
                              builder: (context,
                                  AsyncSnapshot<List<AdminPackages>> snapshot) {
                                if (!snapshot.hasData) {
                                  return Text("Loading...!");
                                } else {
                                  List<AdminPackages> data = snapshot.data!;
                                  return Container(
                                    //color: Color.fromARGB(255, 76, 74, 74),
                                    height: height * 0.9,
                                    width: width * 0.95,

                                    child: ListView.builder(
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return PackageCard(
                                            icon: const FaIcon(
                                              FontAwesomeIcons.crown,
                                              size: 35,
                                              color: Color.fromARGB(
                                                  255, 253, 213, 12),
                                            ),
                                            userId: UserId,
                                            packgeID:
                                                '${data[index].packageId}',
                                            packagename:
                                                '${data[index].packageName}',
                                            recycler:
                                                'Recycler: ${data[index].recycleBag}',
                                            nonrecyler:
                                                'Non-Recycler: ${data[index].nonrecycleBag}',
                                            'Validity: 30 Days',
                                            price:
                                                'Price: ${data[index].price}',
                                            buttontxt: "Buy",
                                            height: height,
                                            width: width,
                                          );

                                          //  AdminCard(
                                          //   txtname:
                                          //       '${data[index].packageName}',
                                          //   txtcity:
                                          //       'Recycler: ${data[index].recycleBag}',
                                          //   txtarea:
                                          //       'Non-Recycler: ${data[index].nonrecycleBag}',
                                          //   txtblock:
                                          //       'Price: ${data[index].price}',
                                          //   width: width * 1.6,
                                          //   height: height * 0.2,
                                          //   fsize: 18.0,
                                          //   txtColor: Colors.black,
                                          // );
                                        }),
                                  );
                                }
                              }),
                        ])))));

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     // FutureBuilder(builder: (context,
    //     //     AsyncSnapshot<List<AdminPackages>> snapshot) {
    //     //   if (!snapshot.hasData) {
    //     //     return const Text("Loading...!");
    //      // }
    //       //  else {
    //       //   List<AdminPackages> data = snapshot.data!;
    //          return ListView.builder(
    //             itemCount: data.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   PackageCard(
    //                     icon: const FaIcon(
    //                       FontAwesomeIcons.crown,
    //                       size: 40,
    //                       color:
    //                           Color.fromARGB(255, 237, 169, 53),
    //                     ),
    //                     packagename:
    //                         '${data[index].packageName}',
    //                     recycler:
    //                         'Recycler :${data[index].recycleBag}',
    //                     nonrecyler:
    //                         'Non-Recyler:${data[index].nonrecycleBag}',
    //                     '',
    //                     price: 'Rs.$data',
    //                     buttontxt: "Buy",
    //                     height: height,
    //                     width: width,
    //                   ),
    //                 ],
    //               );
    //             })])])))));

    // }
    // }
    // PackageCard(
    //   icon: const FaIcon(
    //     FontAwesomeIcons.crown,
    //     size: 35,
    //     color: Color.fromARGB(255, 5, 5, 5),
    //   ),
    //   packagename: 'Basic Plan',
    //   recycler: 'Recycler :20',
    //   nonrecyler: 'Non-Recyler :10',
    //   'Validity: 30 Days',
    //   price: 'Rs.300',
    //   buttontxt: "Buy",
    //   height: height,
    //   width: width,
    // )

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     PackageCard(
    //       icon: const FaIcon(
    //         FontAwesomeIcons.crown,
    //         size: 40,
    //         color: Color.fromARGB(255, 47, 190, 28),
    //       ),
    //       packagename: 'Primium Plan',
    //       recycler: 'Recycler :20',
    //       nonrecyler: 'Non-Recyler',
    //       price: 'Rs.500',
    //       '',
    //       buttontxt: "Buy",
    //       height: height * 0.9,
    //       width: width * 1,
    //     ),
    //   ],
    // ),
  }
}
