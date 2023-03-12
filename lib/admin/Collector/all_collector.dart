import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Collector/add_collecter.dart';
import 'package:garbage_collection/admin/collector_search_delagate.dart';
import 'package:garbage_collection/widgets/admin_card.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_staff_model.dart';
import '../../widgets/driver_collector.dart';

class AllCollector extends StatefulWidget {
  const AllCollector({Key? key}) : super(key: key);

  @override
  State<AllCollector> createState() => _AllCollectorState();
}

PackgeController _con = PackgeController();

class _AllCollectorState extends State<AllCollector> {
  String? dropDownValue;
  var items = [
    'Islamabad',
    'Rawalpindi',
    'Lahore',
    'Faisalabad',
  ];

  void updateList(String value) {}
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
                          title: 'All Collector',
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
                          //   child: InkWell(
                          //     onTap: () => showSearch(
                          //         context: context,
                          //         delegate: SearchCollector()),
                          //     child: textField(
                          //       width: width * 1.6,
                          //       //height: height,
                          //       text: "Search By Name",
                          //       icon: const Icon(Icons.search),
                          //     ),
                          //   ),
                          // ),

                          FutureBuilder(
                              future: _con.getAllCollectorController(),
                              builder: (context,
                                  AsyncSnapshot<List<GetAllStaff>> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  List<GetAllStaff> data = snapshot.data!;
                                  return Container(
                                    //color: Color.fromARGB(255, 76, 74, 74),
                                    height: height * 0.8,
                                    child: ListView.builder(
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return DriverCollector(
                                            txtname: '${data[index].userName}',
                                            txtcity: '${data[index].city}',
                                            txtarea: '${data[index].area}',
                                            txtblock: '${data[index].utype}',
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCollector(),
                                    )),
                                child: button(
                                  title: "Add Collector",
                                  width: width * 0.9,
                                  height: height * 0.06,
                                  fsize: 16.0,
                                  bgColor:
                                      const Color.fromARGB(255, 40, 172, 53),
                                  txtColor: Colors.black,
                                ),
                              ),
                              // InkWell(
                              //   onTap: () => _showDialogBox(context),
                              //   child: button(
                              //     title: "Remove Collector",
                              //     width: width * 0.37,
                              //     height: height * 0.06,
                              //     fsize: 16.0,
                              //     bgColor: Color.fromARGB(255, 246, 88, 88),
                              //     txtColor: Colors.white,
                              //   ),
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
