import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/Models/all_scheduleBlock_list.dart';
import 'package:garbage_collection/Models/schedule_blocks.dart';
import 'package:garbage_collection/admin/Block/add_block.dart';
import 'package:garbage_collection/admin/Block/assign_schedule.dart';
import 'package:garbage_collection/admin/Block/update_block.dart';
import 'package:garbage_collection/api/adminApis/apiGet.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_block_model.dart';
import '../../Models/schedule_block_day.dart';

class AllBlock extends StatefulWidget {
  const AllBlock({Key? key}) : super(key: key);

  @override
  State<AllBlock> createState() => _AllBlockState();
}

bool accept = false;
List<ScheduleBlockDay> userScheduleModelData = <ScheduleBlockDay>[];

PackgeController _con = PackgeController();
AdminApiGetRequest api = AdminApiGetRequest();
List<String> selectDay = <String>['Day'];

class _AllBlockState extends State<AllBlock> {
  bool isloading = true;
  String? day;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  String? selectDayValue;
  String dropdownValue = selectDay.first;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var txtColor;
    var fsize;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/third.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.95,
              // color: Colors.amber,
              //appbar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                  SizedBox(width: width * 0.2),
                  textWidget(
                      title: 'ALL Block',
                      fsize: 30.0,
                      fweight: FontWeight.w500,
                      color: Colors.black),
                ],
              ),
            ),
            Center(
              child: Container(
                width: width * 0.90,
                height: height * 0.88,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            title: "Schedule Block",
                            width: width * 0.37,
                            height: height * 0.05,
                            fsize: 16.0,
                            bgColor:
                                accept == true ? Colors.green : Colors.white,
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
                            title: "Unschedule Block",
                            width: width * 0.37,
                            height: height * 0.05,
                            fsize: 16.0,
                            bgColor:
                                accept == false ? Colors.green : Colors.white,
                            txtColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    accept == true
                        ? FutureBuilder(
                            future: getScheduleBlockController(),
                            builder: (context,
                                AsyncSnapshot<List<ScheduleBlockList>>
                                    snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                List<ScheduleBlockList> data = snapshot.data!;

                                return Container(
                                  //color: Color.fromARGB(255, 76, 74, 74),
                                  height: height * 0.7,
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          width: width * 0.9,
                                          height: height * 0.2,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 244, 251, 234),
                                            elevation: 5,
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            shadowColor: const Color.fromARGB(
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
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.end,
                                                //   children: [
                                                //     InkWell(
                                                //         onTap: () {
                                                //           print("Deleted");
                                                //         },
                                                //         child: const DecoratedIcon(
                                                //           icon: Icon(Icons.delete,
                                                //               color: Colors.red),
                                                //           decoration:
                                                //               IconDecoration(
                                                //             shadows: [
                                                //               Shadow(
                                                //                   blurRadius: 3,
                                                //                   offset:
                                                //                       Offset(3, 0))
                                                //             ],
                                                //           ),
                                                //         )),
                                                //     const SizedBox(
                                                //       width: 20,
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 20,
                                                //     ),
                                                //   ],
                                                // ),
                                                Text(
                                                  '${data[index].blockName}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.green,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              225,
                                                              240,
                                                              182),
                                                    ),
                                                    height: height * 0.05,
                                                    width: width * 0.5,
                                                    child:
                                                        DropdownButton<String>(
                                                      value: dropdownValue,
                                                      icon: const Icon(
                                                          Icons.arrow_downward),
                                                      elevation: 16,
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      // underline: Container(
                                                      //   height: 2,
                                                      //   color: Colors
                                                      //       .deepPurpleAccent,
                                                      // ),
                                                      onChanged:
                                                          (String? value) {
                                                        // This is called when the user selects an item.
                                                        setState(() {
                                                          selectDayValue =
                                                              value!;
                                                        });
                                                      },
                                                      items: selectDay.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    )),

                                                // Text(
                                                //   '${userScheduleModelData[0].days}',
                                                //   style: const TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight:
                                                //           FontWeight.w500),
                                                // ),
                                                // Text(
                                                //   '${data[index].area}',
                                                //   style: const TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight:
                                                //           FontWeight.w500),
                                                // ),
                                                // SizedBox(
                                                //   width: width * 0.06,
                                                // ),
                                                // Text(
                                                //   '${data[index].city}',
                                                //   style: const TextStyle(
                                                //       fontSize: 20,
                                                //       fontWeight:
                                                //           FontWeight.w500),
                                                // ),

                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // InkWell(
                                                //   onTap: () {
                                                //     print(
                                                //         '${data[index].area}');
                                                //     // Navigator.push(
                                                //     //   context,
                                                //     //   MaterialPageRoute(
                                                //     //       builder: (context) =>
                                                //     //           AssignSchedule(
                                                //     //             area:
                                                //     //                 data[index]
                                                //     //                     .area,
                                                //     //           )),
                                                //     // );
                                                //   },
                                                //   child: button(
                                                //       title: "Set Schedual",
                                                //       txtColor: Colors.black,
                                                //       bgColor: Colors.green,
                                                //       // fsize: 20,
                                                //       height: height * 0.03,
                                                //       width: width * 0.4),
                                                // )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }
                            })
                        : FutureBuilder(
                            future: _con.getAllBlockController(),
                            builder: (context,
                                AsyncSnapshot<List<BlockModel>> snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                List<BlockModel> data = snapshot.data!;
                                return Container(
                                  //color: Color.fromARGB(255, 76, 74, 74),
                                  height: height * 0.7,
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          width: width * 0.9,
                                          height: height * 0.2,
                                          child: Card(
                                            color: Color.fromARGB(
                                                255, 244, 251, 234),
                                            elevation: 5,
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            shadowColor: const Color.fromARGB(
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
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.end,
                                                //   children: [
                                                //     InkWell(
                                                //         onTap: () {
                                                //           print("Deleted");
                                                //         },
                                                //         child: const DecoratedIcon(
                                                //           icon: Icon(Icons.delete,
                                                //               color: Colors.red),
                                                //           decoration:
                                                //               IconDecoration(
                                                //             shadows: [
                                                //               Shadow(
                                                //                   blurRadius: 3,
                                                //                   offset:
                                                //                       Offset(3, 0))
                                                //             ],
                                                //           ),
                                                //         )),
                                                //     const SizedBox(
                                                //       width: 20,
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 20,
                                                //     ),
                                                //   ],
                                                // ),
                                                Text(
                                                  'block: ${data[index].blockName}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  'Area: ${data[index].area}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: width * 0.06,
                                                ),
                                                Text(
                                                  'City: ${data[index].city}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AssignSchedule(
                                                                  area: data[
                                                                          index]
                                                                      .area,
                                                                  city: data[
                                                                          index]
                                                                      .city,
                                                                  blockId: data[
                                                                          index]
                                                                      .blockId)),
                                                    );
                                                  },
                                                  child: button(
                                                      title: "Set Schedual",
                                                      txtColor: Colors.black,
                                                      bgColor: Colors.green,
                                                      // fsize: 20,
                                                      height: height * 0.03,
                                                      width: width * 0.4),
                                                )
                                              ],
                                            ),
                                          ),
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
                                  builder: (context) => const AddBlock()),
                            );
                          },
                          child: button(
                            title: "Add Block",
                            width: width * 0.9,
                            height: height * 0.05,
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
                        //           builder: (context) => const UpdateBlock()),
                        //     );
                        //   },
                        //   child: button(
                        //     title: "Update Block",
                        //     width: width * 0.37,
                        //     height: height * 0.05,
                        //     fsize: 16.0,
                        //     bgColor: Color.fromARGB(255, 164, 231, 7),
                        //     txtColor: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  //   List<ScheduleBlockList> allScheduleBlock = <ScheduleBlockList>[];
  // Future<List<ScheduleBlockList>> getScheduleBlockController() async {
  //   AdminApiGetRequest api = AdminApiGetRequest();

  //   var data = await api.getScheduleBlockList();
  //   List<ScheduleBlockList> adlist = [];
  //   data.forEach((element) {
  //     adlist.add(ScheduleBlockList.fromJson(element));
  //   });
  //   print('List ${adlist.length}');
  //   return adlist;
  // }
  int i = 0;
  List<ScheduleBlockList> adlist = [];
  List<ScheduleBlockList> allScheduleBlock = <ScheduleBlockList>[];
  Future<List<ScheduleBlockList>> getScheduleBlockController() async {
    AdminApiGetRequest api = AdminApiGetRequest();

    if (i == 0) {
      var data = await api.getScheduleBlockList();
      List<ScheduleBlockList> adlist = [];

      data.forEach((element) {
        adlist.add(ScheduleBlockList.fromJson(element));
        //  print('blockId ${adlist[element].blockId}');
      });
      print(adlist.length);
      for (int i = 0; i < adlist.length; i++) {
        getAllDay(adlist[i].blockId);
        print('List Data: ${adlist[i].blockId.toString()}');
      }
      i++;
      // print('List ID${adlist[0].blockId}');
      return adlist;
    }
    return adlist;
  }

  // ScheduleBlockDay blockDay = ScheduleBlockDay();
  Future<void> getAllDay(
    blockId,
  ) async {
    //  print("enter");
    AdminApiGetRequest api = AdminApiGetRequest();
    api
        .getBlockDay(
          block_id: blockId,
        )
        .then((value) => {
              value.forEach((element) {
                userScheduleModelData.add(ScheduleBlockDay.fromJson(element));
                selectDay.add(element['Days'].toString());
              }),
            });

    // print('dataLength${userScheduleModelData.length}');
    // for (int i = 0; i < userScheduleModelData.length; i++) {
    //   selectDay.add(userScheduleModelData[i].days.toString());
    // }
  }

  // List<ScheduleAllBlocksModel> adlist = [];
  // data.forEach((element) {
  //   adlist.add(ScheduleBlockList.fromJson(element));
  // });
  // print('List ${adlist.length}');
  // return adlist;

  // ScheduleAllBlocksModel model = ScheduleAllBlocksModel();
  // Future<void> getAllBlocksData(blockId, day) async {
  //   AdminApiGetRequest api = AdminApiGetRequest();

  //   api
  //       .getBlockData(block_id: blockId, day: day)
  //       .then((value) => {model = ScheduleAllBlocksModel.fromJson(value)});
  //   // List<ScheduleAllBlocksModel> adlist = [];
  //   // data.forEach((element) {
  //   //   adlist.add(ScheduleBlockList.fromJson(element));
  //   // });
  //   // print('List ${adlist.length}');
  //   // return adlist;
  // }

}
