import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/deleteApi.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_user_model.dart';
import '../../api/adminApis/putApi.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/user_accept_card.dart';

class AllUser extends StatefulWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  State<AllUser> createState() => _AllCollectorState();
}

bool accept = false;
PackgeController _con = PackgeController();

class _AllCollectorState extends State<AllUser> {
  String? block;
  bool isloading = true;
  List<String> seletBlock = [];

  String? dropDownValue;
  var items = [
    'Islamabad',
    'Rawalpindi',
    'Lahore',
    'Faisalabad',
  ];
  @override
  void initState() {
    // _con.getAllAssignBlockForUserController(city: );
    // .then((value) {
    //   setState(() {
    //     for (int i = 0; i < _con.assignBlockForUser.length; i++) {
    //       seletBlock.add(_con.assignBlockForUser[i].blockName.toString());
    //       print(seletBlock);
    //     }
    //     isloading = false;
    //   });
    // });
  }

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
                        title: 'All User',
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
                        // Container(
                        //   alignment: Alignment.topRight,
                        //   height: height * 0.04,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //         color: Colors.green, width: width * 0.003),
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   margin: const EdgeInsets.only(left: 200.0),
                        //   child: DropdownButton(
                        //       hint: textWidget(
                        //         title: 'Select City',
                        //         fsize: 18.0,
                        //         fweight: FontWeight.w500,
                        //         color: Colors.black,
                        //       ),
                        //       elevation: 40,
                        //       value: dropDownValue,
                        //       items: items.map((String items) {
                        //         return DropdownMenuItem(
                        //           value: items,
                        //           child: Text(items),
                        //         );
                        //       }).toList(),
                        //       onChanged: (String? newValue) {
                        //         setState(() {
                        //           dropDownValue = newValue!;
                        //         });
                        //       }),
                        // ),

                        // Container(
                        //   child: textField(
                        //     width: width * 1.6,
                        //     //height: height,
                        //     text: "Search By Name",
                        //     icon: const Icon(Icons.search),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
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
                                title: "Accept Request",
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
                                title: "Panding Request",
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
                                future: _con.allUserController(),
                                builder: (context,
                                    AsyncSnapshot<List<GetAllUserModel>>
                                        snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    List<GetAllUserModel> data = snapshot.data!;
                                    return Container(
                                      //color: Color.fromARGB(255, 76, 74, 74),
                                      height: height * 0.8,
                                      child: ListView.builder(
                                          itemCount: data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return UserAcceptCard(
                                              txtname:
                                                  'User:  ${data[index].userName}',
                                              txtcity:
                                                  'City: ${data[index].city}',
                                              txtarea:
                                                  'Area: ${data[index].area}',
                                              txtblock:
                                                  'Block: ${data[index].utype}',
                                              width: width * 1.6,
                                              height: height * 0.25,
                                              fsize: 18.0,
                                              txtColor: Colors.black,
                                            );
                                          }),
                                    );
                                  }
                                })
                            : FutureBuilder(
                                future: _con.allPendingUserController(),
                                builder: (context,
                                    AsyncSnapshot<List<GetAllUserModel>>
                                        snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    List<GetAllUserModel> data = snapshot.data!;
                                    return Container(
                                      //color: Color.fromARGB(255, 76, 74, 74),
                                      height: height * 0.8,
                                      child: ListView.builder(
                                          itemCount: data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: height * 0.25,
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    255, 244, 251, 234),
                                                elevation: 5,
                                                margin: const EdgeInsets.only(
                                                    top: 10.0, bottom: 5.0),
                                                shadowColor:
                                                    const Color.fromARGB(
                                                        255, 1, 224, 31),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              AdminDeleteApi()
                                                                  .userDeleteRequest(
                                                                      id: '${data[index].userId}');
                                                              print("Deleted");
                                                            },
                                                            child:
                                                                const DecoratedIcon(
                                                              icon: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red),
                                                              decoration:
                                                                  IconDecoration(
                                                                shadows: [
                                                                  Shadow(
                                                                      blurRadius:
                                                                          3,
                                                                      offset:
                                                                          Offset(
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
                                                              _con
                                                                  .getAllAssignBlockForUserController(
                                                                      city:
                                                                          '${data[index].city}',
                                                                      area:
                                                                          '${data[index].area}')
                                                                  .then(
                                                                      (value) {
                                                                setState(() {
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          _con.assignBlockForUser
                                                                              .length;
                                                                      i++) {
                                                                    seletBlock.add(_con
                                                                        .assignBlockForUser[
                                                                            i]
                                                                        .blockName
                                                                        .toString());
                                                                    print(
                                                                        seletBlock);
                                                                  }
                                                                  isloading =
                                                                      false;
                                                                });
                                                              });

                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (ctx) =>
                                                                        Dialog(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                  ),
                                                                  elevation: 0,
                                                                  backgroundColor:
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          232,
                                                                          246,
                                                                          211),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height *
                                                                            0.25,
                                                                    width:
                                                                        width *
                                                                            0.4,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        const Center(
                                                                            child:
                                                                                Text(
                                                                          "Assign Block",
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),

                                                                        // const SizedBox(
                                                                        //   height:
                                                                        //       10,
                                                                        // ),
                                                                        // SizedBox(
                                                                        //   width:
                                                                        //       width * 0.65,
                                                                        //   child:
                                                                        //       TextField(
                                                                        //     decoration: InputDecoration(
                                                                        //       isCollapsed: true,
                                                                        //       contentPadding: EdgeInsets.all(7),
                                                                        //       labelText: '${data[index].recycleBag}',
                                                                        //       enabledBorder: const UnderlineInputBorder(
                                                                        //         //<-- SEE HERE
                                                                        //         borderSide: BorderSide(width: 2, color: Colors.black),
                                                                        //       ),
                                                                        //     ),
                                                                        //   ),
                                                                        // ),
                                                                        // const SizedBox(
                                                                        //   height:
                                                                        //       10,
                                                                        // ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.65,
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              border: Border.all(
                                                                                color: Colors.green,
                                                                                width: 2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: const Color.fromARGB(255, 225, 240, 182),
                                                                            ),
                                                                            height:
                                                                                height * 0.06,
                                                                            width:
                                                                                width * 0.8,
                                                                            child:
                                                                                CustomDropdownButton2(
                                                                              dropdownWidth: width * 0.87,
                                                                              // buttonWidth: 500,
                                                                              icon: const Icon(Icons.arrow_drop_down, size: 35),
                                                                              buttonDecoration: BoxDecoration(
                                                                                border: Border.all(color: Colors.transparent),
                                                                              ),
                                                                              hint: "Select Block",
                                                                              dropdownItems: seletBlock,
                                                                              value: block,
                                                                              onChanged: (value) {
                                                                                setState(() {
                                                                                  block = value;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // SizedBox(
                                                                        //   width: width *
                                                                        //       0.65,
                                                                        //   child:
                                                                        //       TextField(
                                                                        //     controller:
                                                                        //         tokenEditingController,
                                                                        //     decoration:
                                                                        //         InputDecoration(
                                                                        //       enabledBorder:
                                                                        //           UnderlineInputBorder(
                                                                        //         //<-- SEE HERE
                                                                        //         borderSide: BorderSide(width: 2, color: Colors.black),
                                                                        //       ),
                                                                        //     ),
                                                                        //   ),
                                                                        // ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            FlatButton(
                                                                                focusColor: Color.fromARGB(255, 203, 198, 51),
                                                                                color: Colors.green,
                                                                                minWidth: width * 0.3,
                                                                                onPressed: () {
                                                                                  print('ontap');
                                                                                  AdminApiPut.userAcceptRequest(User_id: '${data[index].userId}', City: '${data[index].city}', Area: '${data[index].area}', Block_name: (_con.assignBlockForUser[0].blockName));
                                                                                  print('object${data[index].userId},${data[index].city},${data[index].area},${data[index].blockName}');
                                                                                },
                                                                                child: const Text(
                                                                                  'Assign',
                                                                                  style: TextStyle(fontSize: 18),
                                                                                )),
                                                                            FlatButton(
                                                                                minWidth: width * 0.3,
                                                                                color: Color.fromARGB(255, 65, 168, 68),
                                                                                hoverColor: Color.fromARGB(255, 238, 228, 46),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: const Text(
                                                                                  'cancel',
                                                                                  style: TextStyle(fontSize: 18),
                                                                                )),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                              // print('check');

                                                              print('check');
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
                                                                      offset:
                                                                          Offset(
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
                                                    textWidget(
                                                        title:
                                                            '${data[index].userId}',
                                                        fsize: 20.0,
                                                        fweight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                    SizedBox(
                                                      width: width * 0.03,
                                                    ),
                                                    textWidget(
                                                        title:
                                                            '${data[index].city}',
                                                        fsize: 20.0,
                                                        fweight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                    textWidget(
                                                        title:
                                                            '${data[index].area}',
                                                        fsize: 20.0,
                                                        fweight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                    textWidget(
                                                        title:
                                                            '${data[index].utype}',
                                                        fsize: 18.0,
                                                        fweight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                              ),
                                            );

                                            //  AdminCard(
                                            //   txtname:
                                            //       '${data[index].userName}',
                                            //   txtcity: '${data[index].city}',
                                            //   txtarea: '${data[index].area}',
                                            //   txtblock: '${data[index].utype}',
                                            //   width: width * 1.6,
                                            //   height: height * 0.2,
                                            //   fsize: 18.0,
                                            //   txtColor: Colors.black,
                                            // );
                                          }),
                                    );
                                  }
                                }),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     InkWell(
                        //       onTap: () => Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => AddCollector(),
                        //           )),
                        //       child: button(
                        //         title: "Add Collector",
                        //         width: width * 0.9,
                        //         height: height * 0.06,
                        //         fsize: 16.0,
                        //         bgColor: Color.fromARGB(255, 40, 172, 53),
                        //         txtColor: Colors.black,
                        //       ),
                        //     ),
                        //     // InkWell(
                        //     //   onTap: () => _showDialogBox(context),
                        //     //   child: button(
                        //     //     title: "Remove Collector",
                        //     //     width: width * 0.37,
                        //     //     height: height * 0.06,
                        //     //     fsize: 16.0,
                        //     //     bgColor: Color.fromARGB(255, 246, 88, 88),
                        //     //     txtColor: Colors.white,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // _showDialogBox(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: new Text("Alert!!"),
  //         content: new Text("Are you sure you want to delete this!"),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: new Text("Yes"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           FlatButton(
  //             child: new Text("No"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //         backgroundColor: Colors.green[50],
  //       );
  //     },
  //   );
  // }
}
