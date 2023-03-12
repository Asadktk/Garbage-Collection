import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:garbage_collection/Controller/packges_controller.dart';
import 'package:garbage_collection/Models/staff_leave.dart';
import 'package:garbage_collection/widgets/staff_leave.dart';

import '../../Models/staf_leave_history_model.dart';
import '../../widgets/text.dart';

class StaffLeaveHistory extends StatefulWidget {
  const StaffLeaveHistory({Key? key}) : super(key: key);

  @override
  State<StaffLeaveHistory> createState() => _StaffLeaveHistoryState();
}

PackgeController _con = PackgeController();

class _StaffLeaveHistoryState extends State<StaffLeaveHistory> {
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
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
            width: width * 0.95,
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
                SizedBox(width: width * 0.15),
                textWidget(
                    title: 'All Staff Leave',
                    fsize: 30.0,
                    fweight: FontWeight.w500,
                    color: Colors.black),
              ],
            ),
          ),
          FutureBuilder(
              future: _con.allLeaveRequestController(),
              builder: (context,
                  AsyncSnapshot<List<StaffLeaveHistoryModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  List<StaffLeaveHistoryModel> data = snapshot.data!;
                  return Container(
                    //color: Color.fromARGB(255, 76, 74, 74),
                    height: height * 0.8,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(data[index].userName);
                          return StaffLeaveView(
                            indexpas: data[index],
                          );
                        }),
                  );
                }
              }),
        ]),
      )),
    );
  }
}
