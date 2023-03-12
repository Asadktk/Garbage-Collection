import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:garbage_collection/api/adminApis/leave_request_api.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/button_widgets.dart';

class CollectorApplyForLeave extends StatefulWidget {
  const CollectorApplyForLeave({Key? key}) : super(key: key);

  @override
  State<CollectorApplyForLeave> createState() => _CollectorApplyForLeaveState();
}

TextEditingController reasonEditController = TextEditingController();

String selectedStartDate = '';
String selectedEndDate = '';
DateTime? Startdate;
DateTime? EndDate;

class _CollectorApplyForLeaveState extends State<CollectorApplyForLeave> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            textWidget(
                title: "Apply For Leave",
                color: Colors.black,
                fsize: 30.0,
                fweight: FontWeight.w500),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.greenAccent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textWidget(
                              title: "Apply For Leave",
                              color: Colors.black,
                              fsize: 30.0,
                              fweight: FontWeight.w500),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textWidget(
                                    title: selectedStartDate == ""
                                        ? "Start Date"
                                        : selectedStartDate.toString(),
                                    color: Colors.black,
                                    fsize: 20.0,
                                    fweight: FontWeight.normal),
                                SizedBox(
                                  width: 70,
                                ),
                                InkWell(
                                  onTap: () {
                                    _selectStartDate(context);
                                  },
                                  child: const Icon(
                                    Icons.date_range,
                                    size: 30,
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          // Row(children: [
                          //   textWidget(
                          //       title: selectedEndDate == ""
                          //           ? "End Date"
                          //           : selectedEndDate.toString(),
                          //       color: Colors.black,
                          //       fsize: 20.0,
                          //       fweight: FontWeight.normal),
                          //   const SizedBox(
                          //     width: 70,
                          //   ),
                          //   InkWell(
                          //     onTap: () {
                          //       _selectEndDate(context);
                          //     },
                          //     child: const Icon(
                          //       Icons.date_range,
                          //       size: 30,
                          //     ),
                          //   ),
                          // ]),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Map data = {
                          //   'car_id': widget.id,
                          //   'from': selectedStartDate,
                          //   'to': selectedEndDate
                          // };

                          // rentalOrder(data);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.95,
              height: height * 0.3,
              child: Card(
                  color: const Color.fromARGB(255, 239, 244, 238),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: reasonEditController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 7, 7),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      minLines: 6,
                      keyboardType: TextInputType.multiline,
                      maxLines: null, //or null
                      decoration: const InputDecoration.collapsed(
                          hintText: "Enter your Reason"),
                    ),
                  )),
            ),
            InkWell(
              onTap: () async {
                Map data = {
                  "From_date": selectedStartDate,
                  "To_date": selectedEndDate,
                  "Reason": reasonEditController.text
                };
                SharedPreferences pref = await SharedPreferences.getInstance();

                var uid = pref.getString('User_id');
                LeaveRequestApi.staffAplyForLeave(
                    id: uid, data: data, context: context);
              },
              child: button(
                  fsize: 20.0,
                  title: 'Add Complaint',
                  width: width * 0.95,
                  height: height * 0.06,
                  bgColor: Colors.green[400]),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        //  Startdate = picked;
        selectedStartDate = ('${picked.day}-${picked.month}-${picked.year}');
        // _dateController.text = selectedDate;
        print(selectedStartDate);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = ('${picked.day}-${picked.month}-${picked.year}');

        print(EndDate);
      });
    } else {
      return;
    }
  }
}
