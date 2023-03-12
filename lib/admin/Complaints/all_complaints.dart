import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_complaint_model.dart';
import '../../widgets/all_complaint_admin_card.dart';

class AllCompaints extends StatefulWidget {
  const AllCompaints({Key? key}) : super(key: key);

  @override
  State<AllCompaints> createState() => _AllComplaintstate();
}

PackgeController _con = PackgeController();
var Cid;

class _AllComplaintstate extends State<AllCompaints> {
  String? dropDownValue;
  var items = [
    'Islamabad',
    'Rawalpindi',
    'Lahore',
    'Faisalabad',
  ];
  bool accept = false;
  // @override
  // void initState() {
  //   // _con.adminPackagesListController();
  //   GetType();
  //   super.initState();
  // }

  // // ignore: non_constant_identifier_names
  // GetType() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     // Utype = pref.getString('Utype');
  //     Cid = pref.getInt('Cid');
  //     //  print(Utype);
  //     print('Customer id ${Cid}');
  //   });
  // }

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
          body: Column(
            children: [
              SizedBox(
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
                        title: 'All Complaints',
                        fsize: 30.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                    Container(),
                  ],
                ),
              ),
              //column children
              Center(
                child: SizedBox(
                  //   color: Colors.amber,
                  width: width * 0.90,
                  height: height * 0.90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        FutureBuilder(
                            future: _con.allComplaintController(),
                            builder: (context,
                                AsyncSnapshot<List<AllComplaintModel>>
                                    snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                List<AllComplaintModel> data = snapshot.data!;
                                return SizedBox(
                                  //color: Color.fromARGB(255, 76, 74, 74),
                                  height: height * 0.85,
                                  child: ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ComplaintAdminCard(
                                          txtname: '${data[index].userName}',
                                          txtcity: 'City: ${data[index].city}',
                                          txtarea: 'Area: ${data[index].area}',
                                          txtblock:
                                              'Complaint: ${data[index].description}',
                                          Qty: 'Quantity: ${data[index].qty}',
                                          Date: 'Date: ${data[index].date}',
                                          context: context,
                                          Cid: '${data[index].cid}',
                                          width: width * 1.6,
                                          height: height * 0.3,
                                          fsize: 18.0,
                                          txtColor: Colors.black,
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
    );
  }
}
