import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:garbage_collection/api/adminApis/putApi.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../Controller/packges_controller.dart';
import '../Models/all_garbage_request_model.dart';
import '../api/adminApis/deleteApi.dart';
import '../widgets/text.dart';

class GarbageRequestCollectorSide extends StatefulWidget {
  const GarbageRequestCollectorSide({Key? key}) : super(key: key);

  @override
  State<GarbageRequestCollectorSide> createState() =>
      _GarbageRequestCollectorSideState();
}

PackgeController _con = PackgeController();
var GarbageId;

class _GarbageRequestCollectorSideState
    extends State<GarbageRequestCollectorSide> {
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
                        title: 'Garbage Request',
                        fsize: 30.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                    Container(),
                  ],
                ),
              ),
              FutureBuilder(
                  future: _con.allGarbageRequestController(),
                  builder: (context,
                      AsyncSnapshot<List<GetAllGarbageRequestModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading...!");
                    } else {
                      List<GetAllGarbageRequestModel> data = snapshot.data!;
                      // List<PackageRequest> data = snapshot.data!;
                      return Center(
                        child: Container(
                          width: width * 0.95,
                          //color: Color.fromARGB(255, 76, 74, 74),
                          height: height * 0.8,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
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
                                        const Color.fromARGB(255, 1, 224, 31),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  AdminDeleteApi()
                                                      .deleteGarbageRequest(
                                                          GRequest_id: int.parse(
                                                              '${data[index].garbageId}'));
                                                  print("Deleted");
                                                },
                                                child: const DecoratedIcon(
                                                  icon: Icon(Icons.delete,
                                                      color: Colors.red),
                                                  decoration: IconDecoration(
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 3,
                                                          offset: Offset(3, 0))
                                                    ],
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  AdminApiPut()
                                                      .acceptGarbagerequest(
                                                          GarbageId: data[index]
                                                              .garbageId);
                                                  // print('check');
                                                },
                                                child: const DecoratedIcon(
                                                  icon: Icon(Icons.check,
                                                      color: Colors.blue),
                                                  decoration: IconDecoration(
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 3,
                                                          offset: Offset(1, 0))
                                                    ],
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        textWidget(
                                          title: '${data[index].userName}',
                                          fsize: 30.0,
                                          fweight: FontWeight.w500,
                                        ),
                                        textWidget(
                                          title: 'City: ${data[index].city}',
                                          fsize: 25.0,
                                          fweight: FontWeight.w400,
                                        ),
                                        textWidget(
                                          title: 'Area: ${data[index].area}',
                                          fsize: 25.0,
                                          fweight: FontWeight.w400,
                                        ),
                                        textWidget(
                                          title:
                                              'Block: ${data[index].blockName}',
                                          fsize: 25.0,
                                          fweight: FontWeight.w400,
                                        ),
                                        // GarbageId=${data[index].garbageId}, convert into int parse int parse
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
