import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Vehicles/add_vehicle.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';
import 'package:garbage_collection/widgets/vehicle_widget.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/admin_vehicle_model.dart';

class AllVehicles extends StatefulWidget {
  AllVehicles({Key? key}) : super(key: key);

  @override
  State<AllVehicles> createState() => _AllVehiclesState();
}

class _AllVehiclesState extends State<AllVehicles> {
  PackgeController _con = PackgeController();

  // @override
  // void initState() {
  //   super.initState();

  //   _con?.getAllVehicle;
  // }
  String? dropDownValue;
  var items = [
    'Islamabad',
    'Rawalpindi',
    'Lahore',
    'Faisalabad',
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/second.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //appbar
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                        onPressed: () => Navigator.of(context).pop(null),
                      ),
                      textWidget(
                          title: 'All Vehicles',
                          fsize: 30.0,
                          fweight: FontWeight.w500,
                          color: Colors.black),
                      Container(),
                    ],
                  ),
                ),
                // Center(
                //   child: Container(
                //     width: width * 0.90,
                //     height: height * 0.15,
                //     // color: Colors.black,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         SizedBox(
                //           height: height * 0.02,
                //         ),
                //         Container(
                //           alignment: Alignment.topRight,
                //           height: height * 0.04,
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Colors.green, width: width * 0.003),
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           margin: EdgeInsets.only(left: 200.0),
                //           child: DropdownButton(
                //               hint: textWidget(
                //                 title: 'Select City',
                //                 fsize: 18.0,
                //                 fweight: FontWeight.w500,
                //                 color: Colors.black,
                //               ),
                //               elevation: 40,
                //               value: dropDownValue,
                //               items: items.map((String items) {
                //                 return DropdownMenuItem(
                //                   value: items,
                //                   child: Text(items),
                //                 );
                //               }).toList(),
                //               onChanged: (String? newValue) {
                //                 setState(() {
                //                   dropDownValue = newValue!;
                //                 });
                //               }),
                //         ),
                //         Container(
                //           child: textField(
                //             width: width * 1.6,
                //             //height: height,
                //             text: "Search By Name",
                //             icon: Icon(Icons.search),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: height * 0.02,
                ),
                FutureBuilder(
                    future: _con.getAllVehicleController(),
                    builder: (context,
                        AsyncSnapshot<List<AdminAllVehicle>> snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading...!");
                      } else {
                        List<AdminAllVehicle> data = snapshot.data!;
                        return Container(
                          width: width * 0.90,
                          height: height * 0.8,
                          // color: Colors.amber,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return VehiclesCard(
                                txtname: '${data[index].vehicleName}',
                                txtregNo: '${data[index].vehicleRegno}',
                                width: width * 1,
                                height: height * 0.2,
                                fsize: 18.0,
                                txtColor: Colors.black,
                              );
                            },
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width * 0.90,
                  height: height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddVehicle()),
                          );
                        },
                        child: button(
                          title: "Add Vehicle",
                          width: width * 0.8,
                          height: height * 0.06,
                          fsize: 16.0,
                          bgColor: Color.fromARGB(255, 40, 172, 53),
                          txtColor: Colors.black,
                        ),
                      ),
                      // button(
                      //   title: "Remove Vehicle Schedule",
                      //   width: width * 0.7,
                      //   height: height * 0.06,
                      //   fsize: 16.0,
                      //   bgColor: Color.fromARGB(255, 250, 45, 45),
                      //   txtColor: Colors.black,
                      // ),
                      button(
                        title: "Update Vehicle",
                        width: width * 0.7,
                        height: height * 0.06,
                        fsize: 16.0,
                        bgColor: Color.fromARGB(255, 205, 239, 54),
                        txtColor: Colors.black,
                      ),
                    ],
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
