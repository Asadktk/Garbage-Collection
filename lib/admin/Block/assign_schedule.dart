import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/apiGet.dart';
import 'package:garbage_collection/api/adminApis/apiPost.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';

import '../../widgets/text.dart';

class AssignSchedule extends StatefulWidget {
  var area;
  var city;
  var blockId;
  AssignSchedule({Key? key, this.area, this.city, this.blockId})
      : super(key: key);

  @override
  State<AssignSchedule> createState() => _AssignScheduleState();
}

class _AssignScheduleState extends State<AssignSchedule> {
  String _radioValue = 'Morning';
  List<String> selectedDays = [];

  @override
  void initState() {
    // TODO: implement initState
    print('area${widget.area}');
    super.initState();
  }

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
          body: Column(
            children: [
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
                        title: 'Assign Schedule',
                        fsize: 30.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                  ],
                ),
              ),
              CheckboxListTile(
                title: const Text("Monday"),
                value: selectedDays.contains("Monday"),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Monday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Monday",
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Monday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Tuesday"),
                value: selectedDays.contains("Tuesday"),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Tuesday");
                      AdminApiGetRequest().getDayForblock(
                          Day: 'Tuesday',
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Tuesday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Wednesday"),
                value: selectedDays.contains("Wednesday"),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Wednesday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Wednesday",
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Wednesday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Thursday"),
                value: selectedDays.contains("Thursday"),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Thursday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Thursday",
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Thursday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Friday"),
                value: selectedDays.contains("Friday"),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Friday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Friday",
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Friday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Saturday"),
                value: selectedDays.contains("Saturday"),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Saturday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Saturday",
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Saturday");
                    }
                  });
                },
              ),

              CheckboxListTile(
                title: Text("Sunday"),
                value: selectedDays.contains("Sunday"),
                onChanged: (bool? value) {
                  setState(() {
                    if (value!) {
                      selectedDays.add("Sunday");
                      AdminApiGetRequest().getDayForblock(
                          Day: "Sunday".toString(),
                          Area: '${widget.area}',
                          City: '${widget.city}');
                    } else {
                      selectedDays.remove("Sunday");
                    }
                  });
                },
              ),

              // Center(
              //   child: Container(
              //     // color: Colors.amber,
              //     width: width * 0.95,
              //     // height: height * 0.85,
              //     child: Column(
              //       children: [
              //         ...notifications.map(builSingleCheckbox).toList(),
              //       ],
              //     ),
              //   ),
              // ),

              textWidget(
                  title: "Select Shift:",
                  color: Colors.black,
                  fsize: 20.0,
                  fweight: FontWeight.bold),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text("Morning"),
                        leading: Radio(
                          value: 'Morning',
                          groupValue: _radioValue,
                          onChanged: (String? value) {
                            setState(() {
                              _radioValue = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text("Evening"),
                        leading: Radio(
                          value: 'Evening',
                          groupValue: _radioValue,
                          onChanged: (String? value) {
                            setState(() {
                              _radioValue = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  AdminApiPost.setBlockSchedule(
                      Shift: _radioValue, Block_id: '${widget.blockId}');
                },
                child: button(
                    title: "Add",
                    fsize: 22.0,
                    bgColor: Colors.green,
                    txtColor: Colors.white,
                    width: width * 0.9,
                    height: height * 0.05),
              ),

              // CustomDropDownWigetState(),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // // TODO: implement widget
  // Widget builSingleCheckbox(CheckBoxState checkbox) => Visibility(
  //       // visible: true,
  //       child: CheckboxListTile(
  //         controlAffinity: ListTileControlAffinity.leading,
  //         checkColor: Colors.white,

  //         // fillColor: MaterialStateProperty.resolveWith(getColor),
  //         activeColor: Colors.green,
  //         value: checkbox.isChecked,
  //         title: Text(checkbox.title),

  //         onChanged: (bool? value) {
  //           setState(() {
  //             checkbox.isChecked = value!;
  //             AdminApiGetRequest()
  //                 .getDayForblock(Day: 'Monday', Area: '6-road', City: 'rwp');
  //           });
  //         },
  //       ),
  //     );

}
