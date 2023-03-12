import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_garbage_request_model.dart';
import '../../Models/all_missing_token_adminside.dart';
import '../../api/adminApis/deleteApi.dart';

class PackageRequest extends StatefulWidget {
  const PackageRequest({Key? key}) : super(key: key);

  @override
  State<PackageRequest> createState() => _PackageRequestState();
}

PackgeController _con = PackgeController();
var UserId;

class _PackageRequestState extends State<PackageRequest> {
  TextEditingController tokenEditingController = TextEditingController();

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
      UserId = pref.getString('User_id');
      // print(Utype);
      print(UserId);
    });
  }

  bool accept = false;
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width * 0.95,
                  //     color: Colors.amber,
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
                          title: 'Package Request',
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
                    //   color: Colors.amber,
                    width: width * 0.90,
                    height: height * 0.90,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    accept = true;
                                  });
                                },
                                child: button(
                                  title: "Package Request",
                                  width: width * 0.37,
                                  height: height * 0.06,
                                  fsize: 16.0,
                                  bgColor: accept == true
                                      ? Colors.green
                                      : Colors.white,
                                  txtColor: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    accept = false;
                                  });
                                },
                                child: button(
                                  title: "Missing Token",
                                  width: width * 0.37,
                                  height: height * 0.06,
                                  fsize: 16.0,
                                  bgColor: accept == false
                                      ? Colors.green
                                      : Colors.white,
                                  txtColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          accept == true
                              ? FutureBuilder(
                                  future: _con.userPackagesRequestController(),
                                  builder: (context,
                                      AsyncSnapshot<List<dynamic>> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text("Loading...!");
                                    } else {
                                      List<dynamic> data = snapshot.data!;
                                      // List<PackageRequest> data = snapshot.data!;
                                      return Container(
                                        //color: Color.fromARGB(255, 76, 74, 74),
                                        height: height * 0.8,
                                        child: ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                width: width,
                                                height: height * 0.25,
                                                child: Card(
                                                  color: const Color.fromARGB(
                                                      255, 244, 251, 234),
                                                  elevation: 5,
                                                  margin: const EdgeInsets.only(
                                                    top: 10.0,
                                                  ),
                                                  shadowColor:
                                                      const Color.fromARGB(
                                                          255, 1, 224, 31),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                AdminDeleteApi()
                                                                    .deletePackageRequest(
                                                                        PRequest_id:
                                                                            data[index].upId);
                                                                print(
                                                                    "Deleted");
                                                              },
                                                              child:
                                                                  const DecoratedIcon(
                                                                icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red),
                                                                decoration:
                                                                    IconDecoration(
                                                                  shadows: [
                                                                    Shadow(
                                                                        blurRadius:
                                                                            3,
                                                                        offset: Offset(
                                                                            3,
                                                                            0))
                                                                  ],
                                                                ),
                                                              )),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                // onPressed: () {
                                                                // print('ontap');
                                                                // print("UserId" + UserId);
                                                                _con.postGenerateTokenController(
                                                                  upId:
                                                                      "${data[index].upId}",
                                                                  // userId: UserId,
                                                                  // TokenNo: tokenEditingController.text,
                                                                  recycleBag:
                                                                      "${data[index].recycleBag}",
                                                                  nonrecycleBag:
                                                                      "${data[index].nonrecycleBag}",
                                                                );

                                                                // showDialog(
                                                                //   context:
                                                                //       context,
                                                                //   builder:
                                                                //       (ctx) =>
                                                                //           Dialog(
                                                                //     shape:
                                                                //         RoundedRectangleBorder(
                                                                //       borderRadius:
                                                                //           BorderRadius.circular(
                                                                //               20),
                                                                //     ),
                                                                //     elevation:
                                                                //         0,
                                                                //     backgroundColor:
                                                                //         const Color.fromARGB(
                                                                //             255,
                                                                //             232,
                                                                //             246,
                                                                //             211),
                                                                //     child:
                                                                //         Container(
                                                                //       height:
                                                                //           height *
                                                                //               0.4,
                                                                //       width:
                                                                //           width *
                                                                //               0.4,
                                                                //       child:
                                                                //           Column(
                                                                //         mainAxisSize:
                                                                //             MainAxisSize.min,
                                                                //         children: [
                                                                //           const SizedBox(
                                                                //             height:
                                                                //                 20,
                                                                //           ),
                                                                //           const Center(
                                                                //               child: Text(
                                                                //             "Assign Token",
                                                                //             style:
                                                                //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                //           )),
                                                                //           const SizedBox(
                                                                //             height:
                                                                //                 15,
                                                                //           ),
                                                                //           SizedBox(
                                                                //             width:
                                                                //                 width * 0.65,
                                                                //             child:
                                                                //                 TextField(
                                                                //               decoration: InputDecoration(
                                                                //                 isCollapsed: true,
                                                                //                 contentPadding: EdgeInsets.all(2),
                                                                //                 labelText: '${data[index].upId}',
                                                                //                 enabledBorder: const UnderlineInputBorder(
                                                                //                   //<-- SEE HERE
                                                                //                   borderSide: BorderSide(width: 2, color: Colors.black),
                                                                //                 ),
                                                                //               ),
                                                                //             ),
                                                                //           ),
                                                                //           const SizedBox(
                                                                //             height:
                                                                //                 10,
                                                                //           ),
                                                                //           SizedBox(
                                                                //             width:
                                                                //                 width * 0.65,
                                                                //             child:
                                                                //                 TextField(
                                                                //               decoration: InputDecoration(
                                                                //                 isCollapsed: true,
                                                                //                 contentPadding: EdgeInsets.all(7),
                                                                //                 labelText: '${data[index].recycleBag}',
                                                                //                 enabledBorder: const UnderlineInputBorder(
                                                                //                   //<-- SEE HERE
                                                                //                   borderSide: BorderSide(width: 2, color: Colors.black),
                                                                //                 ),
                                                                //               ),
                                                                //             ),
                                                                //           ),
                                                                //           const SizedBox(
                                                                //             height:
                                                                //                 10,
                                                                //           ),
                                                                //           SizedBox(
                                                                //             width:
                                                                //                 width * 0.65,
                                                                //             child:
                                                                //                 TextField(
                                                                //               decoration: InputDecoration(
                                                                //                 isCollapsed: true,
                                                                //                 contentPadding: EdgeInsets.all(7),
                                                                //                 labelText: '${data[index].nonrecycleBag}',
                                                                //                 enabledBorder: const UnderlineInputBorder(
                                                                //                   //<-- SEE HERE
                                                                //                   borderSide: BorderSide(width: 2, color: Colors.black),
                                                                //                 ),
                                                                //               ),
                                                                //             ),
                                                                //           ),
                                                                //           // SizedBox(
                                                                //           //   width: width *
                                                                //           //       0.65,
                                                                //           //   child:
                                                                //           //       TextField(
                                                                //           //     controller:
                                                                //           //         tokenEditingController,
                                                                //           //     decoration:
                                                                //           //         InputDecoration(
                                                                //           //       enabledBorder:
                                                                //           //           UnderlineInputBorder(
                                                                //           //         //<-- SEE HERE
                                                                //           //         borderSide: BorderSide(width: 2, color: Colors.black),
                                                                //           //       ),
                                                                //           //     ),
                                                                //           //   ),
                                                                //           // ),
                                                                //           const SizedBox(
                                                                //             height:
                                                                //                 10,
                                                                //           ),
                                                                //           Row(
                                                                //             children: [
                                                                //               FlatButton(
                                                                //                   onPressed: () {
                                                                //                     // print('ontap');
                                                                //                     // print("UserId" + UserId);
                                                                //                     _con.postGenerateTokenController(
                                                                //                       upId: "${data[index].upId}",
                                                                //                       // userId: UserId,
                                                                //                       // TokenNo: tokenEditingController.text,
                                                                //                       recycleBag: "${data[index].recycleBag}",
                                                                //                       nonrecycleBag: "${data[index].nonrecycleBag}",
                                                                //                     );
                                                                //                   },
                                                                //                   child: const Text(
                                                                //                     'generate',
                                                                //                     style: TextStyle(fontSize: 18),
                                                                //                   )),
                                                                //               FlatButton(
                                                                //                   onPressed: () {
                                                                //                     Navigator.of(context).pop();
                                                                //                   },
                                                                //                   child: const Text(
                                                                //                     'cancel',
                                                                //                     style: TextStyle(fontSize: 18),
                                                                //                   )),
                                                                //             ],
                                                                //           )
                                                                //         ],
                                                                //       ),
                                                                //     ),
                                                                //   ),
                                                                // );
                                                                // // print('check');
                                                              },
                                                              child:
                                                                  const DecoratedIcon(
                                                                icon: Icon(
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .blue),
                                                                decoration:
                                                                    IconDecoration(
                                                                  shadows: [
                                                                    Shadow(
                                                                        blurRadius:
                                                                            3,
                                                                        offset: Offset(
                                                                            1,
                                                                            0))
                                                                  ],
                                                                ),
                                                              )),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        "${data[index].upId}",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "${data[index].userName}",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),

                                                      Text(
                                                        '${data[index].packageName}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),

                                                      Text(
                                                        'Recycler: ${data[index].recycleBag}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        'NonRecycler: ${data[index].nonrecycleBag}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),

                                                      // textWidget(
                                                      //     title: txtarea,
                                                      //     fsize: fsize,
                                                      //     fweight: FontWeight.w500,
                                                      //     color: txtColor),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      );
                                    }
                                  })
                              : FutureBuilder(
                                  future: _con.getMissingTokenController(),
                                  builder: (context,
                                      AsyncSnapshot<
                                              List<GetAllMissingTokenModel>>
                                          snapshot) {
                                    if (!snapshot.hasData) {
                                      return Text("Loading...!");
                                    } else {
                                      List<GetAllMissingTokenModel> data =
                                          snapshot.data!;
                                      // List<PackageRequest> data = snapshot.data!;
                                      return Container(
                                        //color: Color.fromARGB(255, 76, 74, 74),
                                        height: height * 0.8,
                                        child: ListView.builder(
                                            itemCount: data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                width: width,
                                                height: height * 0.25,
                                                child: Card(
                                                  color: const Color.fromARGB(
                                                      255, 244, 251, 234),
                                                  elevation: 5,
                                                  margin: const EdgeInsets.only(
                                                    top: 10.0,
                                                  ),
                                                  shadowColor:
                                                      const Color.fromARGB(
                                                          255, 1, 224, 31),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                print(
                                                                    "Deleted");
                                                              },
                                                              child:
                                                                  const DecoratedIcon(
                                                                icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red),
                                                                decoration:
                                                                    IconDecoration(
                                                                  shadows: [
                                                                    Shadow(
                                                                        blurRadius:
                                                                            3,
                                                                        offset: Offset(
                                                                            3,
                                                                            0))
                                                                  ],
                                                                ),
                                                              )),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                // print('check');
                                                              },
                                                              child:
                                                                  const DecoratedIcon(
                                                                icon: Icon(
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .blue),
                                                                decoration:
                                                                    IconDecoration(
                                                                  shadows: [
                                                                    Shadow(
                                                                        blurRadius:
                                                                            3,
                                                                        offset: Offset(
                                                                            1,
                                                                            0))
                                                                  ],
                                                                ),
                                                              )),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        "${data[index].upId}",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "${data[index].userName}",
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        '${data[index].packageName}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        'Recycler: ${data[index].recycleBag}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        'NonRecycler: ${data[index].nonrecycleBag}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      );
                                    }
                                  }),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
