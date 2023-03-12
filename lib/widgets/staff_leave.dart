import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/deleteApi.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../admin/Dashboard/admin_dashboard.dart';

class StaffLeaveView extends StatefulWidget {
  final indexpas;
  StaffLeaveView({Key? key, required this.indexpas}) : super(key: key);

  @override
  State<StaffLeaveView> createState() => _StaffLeaveViewState();
}

class _StaffLeaveViewState extends State<StaffLeaveView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        color: Color.fromARGB(255, 244, 251, 234),
        elevation: 5,
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        shadowColor: const Color.fromARGB(255, 1, 224, 31),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      // AdminDeleteApi()
                      //     .deletePackage(pname: txtname)
                      //     .then((value) => Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   const AdminDashBoard()),
                      //         ));

                      // print("Deleted");
                    },
                    child: const DecoratedIcon(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 40,
                      ),
                      decoration: IconDecoration(
                        shadows: [Shadow(blurRadius: 3, offset: Offset(3, 0))],
                      ),
                    )),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () {
                      // AdminDeleteApi()
                      //     .deletePackage(pname: txtname)
                      //     .then((value) => Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   const AdminDashBoard()),
                      //         ));

                      // print("Deleted");
                    },
                    child: const DecoratedIcon(
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 40,
                      ),
                      decoration: IconDecoration(
                        shadows: [Shadow(blurRadius: 3, offset: Offset(3, 0))],
                      ),
                    )),
                const SizedBox(
                  width: 20,
                ),
                // InkWell(
                //     onTap: () {
                //       print('check');
                //     },
                //     child: const DecoratedIcon(
                //       icon: Icon(Icons.check, color: Colors.blue),
                //       decoration: IconDecoration(
                //         shadows: [Shadow(blurRadius: 3, offset: Offset(1, 0))],
                //       ),
                //     )),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            textWidget(
                title: widget.indexpas.userName,
                fsize: 25.0,
                fweight: FontWeight.w500,
                color: Colors.black),
            SizedBox(
              width: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     textWidget(
            //         title: "City",
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //     textWidget(
            //         title: widget.indexpas.city,
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textWidget(
                    title: "From ",
                    fsize: 19.0,
                    fweight: FontWeight.w500,
                    color: Colors.black),
                textWidget(
                    title: widget.indexpas.fromDate.toString(),
                    fsize: 19.0,
                    fweight: FontWeight.w500,
                    color: Colors.black),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     textWidget(
            //         title: "To ",
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //     textWidget(
            //         title: widget.indexpas.toDate,
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //   ],
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     textWidget(
            //         title: "Reason ",
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //     textWidget(
            //         title: widget.indexpas.reason,
            //         fsize: 19.0,
            //         fweight: FontWeight.w500,
            //         color: Colors.black),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}


//Show Dailogue for creating token
