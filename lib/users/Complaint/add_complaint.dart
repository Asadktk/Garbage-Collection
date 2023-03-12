// import 'package:flutter/material.dart';
// import 'package:garbage_collection/widgets/button_widgets.dart';
// import 'package:garbage_collection/widgets/text.dart';
// import 'package:garbage_collection/widgets/textfield.dart';
import 'dart:async';

import 'package:garbage_collection/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/packges_controller.dart';
import '../../../api/userapi/apiPost.dart';

import 'package:flutter/material.dart';
import '../../../widgets/button_widgets.dart';
import '../../../widgets/text.dart';

class UserComplaints extends StatefulWidget {
  const UserComplaints({Key? key}) : super(key: key);

  @override
  State<UserComplaints> createState() => _UserComplaintsState();
}

PackgeController _con = PackgeController();
var UserId;

class _UserComplaintsState extends State<UserComplaints> {
  TextEditingController complaintEditController = TextEditingController();
  String selectedStartDate = '';
  TextEditingController qtyEditingController = TextEditingController();
  var qty = 0;
  @override
  void initState() {
    _con.adminPackagesListController();
    GetType();
    super.initState();
  }

  void add() {
    setState(() {
      qty++;
    });
  }

  void Sub() {
    setState(() {
      qty--;
    });
  }

  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      UserId = pref.getString('User_id');
      // print(Utype);
      print(UserId);
    });
  }

  List<String> comlaint = [
    "We Are Sorry Your Request Are Not Valid",
    "Your Request Are Vaild We collect Your garbage",
    "Your Request Are Vaild We collect Your garbage",
  ];
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
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                  const SizedBox(
                    width: 315,
                  ),
                  const Image(
                    image: AssetImage('assets/user_profile.png'),
                    width: 40,
                  ),
                ],
              ),
            ),
            textWidget(
                title: "Add Complaint",
                fsize: 30.0,
                fweight: FontWeight.w500,
                color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: Radius.circular(20.0)
              // ),
              width: width * 0.93,
              height: height * 0.05,
              color: Colors.green[400],
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textWidget(
                        title: selectedStartDate == ""
                            ? "Start Date"
                            : selectedStartDate.toString(),
                        color: Colors.black,
                        fsize: 20.0,
                        fweight: FontWeight.normal),
                    const SizedBox(
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
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textWidget(
                    title: qty.toString(),
                    fsize: 30.0,
                    fweight: FontWeight.w500,
                    color: Colors.black),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () => add(),
                  child: button(
                      title: "+",
                      fsize: 20.0,
                      width: width * 0.2,
                      height: height * 0.04,
                      bgColor: Color.fromARGB(255, 243, 236, 236)),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () => Sub(),
                  child: button(
                      title: "-",
                      fsize: 20.0,
                      width: width * 0.2,
                      height: height * 0.04,
                      bgColor: Color.fromARGB(255, 243, 236, 236)),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
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
                      controller: complaintEditController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 12, 7, 7),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      minLines: 6,
                      keyboardType: TextInputType.multiline,
                      maxLines: null, //or null
                      decoration: const InputDecoration.collapsed(
                          hintText: "Enter your complaint"),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _con.userSendComplaintController(
                  userId: UserId,
                  complaint: complaintEditController.text,
                  Qty: qty,
                  date: selectedStartDate,
                );

                Timer(
                    const Duration(seconds: 3),
                    () => showDialog(
                          context: context,
                          builder: (ctx) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 232, 246, 211),
                            child: Container(
                              height: height * 0.2,
                              width: width * 0.4,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  qty.isEven
                                      ? Center(
                                          child: Text(
                                          "Youre Complaint is Valid",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                      : Center(
                                          child: Text(
                                          "Yor Complaint is not Valid",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop(null);
                                      },
                                      child: Icon(
                                        Icons.cancel,
                                        size: 50,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                // print('check');
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
}


// class UserComplaints extends StatefulWidget {
//   const UserComplaints({Key? key}) : super(key: key);

//   @override
//   State<UserComplaints> createState() => _UserComplaintsState();
// }

// PackgeController _con = PackgeController();
// var UserId;

// class _UserComplaintsState extends State<UserComplaints> {

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     UserApiPost userApi = UserApiPost();
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
//       child: SafeArea(
//           child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.arrow_back,
//                         size: 40,
//                       ),
//                       onPressed: () => Navigator.of(context).pop(null),
//                     ),
//                     SizedBox(width: 80.0),
//                     textWidget(
//                         title: "My Compalints",
//                         fsize: 27.0,
//                         fweight: FontWeight.bold)
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: textField(
//                     textController: complaintEditController,
//                     text: "Enter Your Complaints",
//                     width: width * 1),
//               ),
//               InkWell(
//                 onTap: () => _con.userSendComplaintController(
//                     userId: UserId, complaint: complaintEditController),
//                 child: button(
//                     title: "Send Complaint",
//                     width: width * 0.5,
//                     height: height * 0.05,
//                     fsize: 20.0,
//                     bgColor: Colors.green,
//                     txtColor: Colors.white),
//               ),
//               SizedBox(
//                 height: 129.0,
//               ),
//               SizedBox(
//                 height: 129.0,
//               ),
//               SizedBox(
//                 height: 129.0,
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
