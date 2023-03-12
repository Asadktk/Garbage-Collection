import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Dashboard/admin_dashboard.dart';
import 'package:garbage_collection/api/adminApis/deleteApi.dart';
import 'package:garbage_collection/api/adminApis/putApi.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:icon_decoration/icon_decoration.dart';

Widget ComplaintAdminCard(
    {var txtname,
    var Cid,
    var txtcity,
    var txtarea,
    var txtblock,
    var Qty,
    var Date,
    context,
    width,
    height,
    fsize,
    bgColor,
    txtColor}) {
  return Container(
    width: width,
    height: height,
    child: Card(
      color: const Color.fromARGB(255, 244, 251, 234),
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
                    AdminDeleteApi().deleteComplaint(Cid: Cid);
                    print("Deleted");
                  },
                  child: const DecoratedIcon(
                    icon: Icon(Icons.delete, color: Colors.red),
                    decoration: IconDecoration(
                      shadows: [Shadow(blurRadius: 3, offset: Offset(3, 0))],
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    AdminApiPut()
                        .updateComplaint(Cid: Cid)
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminDashBoard()),
                            ));
                    print('check');
                  },
                  child: const DecoratedIcon(
                    icon: Icon(Icons.check, color: Colors.blue),
                    decoration: IconDecoration(
                      shadows: [Shadow(blurRadius: 3, offset: Offset(1, 0))],
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          textWidget(
              title: txtname,
              fsize: fsize * 1.6,
              fweight: FontWeight.w500,
              color: txtColor),
          SizedBox(
            width: width * 0.03,
          ),
          textWidget(
              title: txtcity,
              fsize: fsize,
              fweight: FontWeight.w500,
              color: txtColor),
          textWidget(
              title: txtarea,
              fsize: fsize,
              fweight: FontWeight.w500,
              color: txtColor),
          textWidget(
              title: txtblock,
              fsize: fsize,
              fweight: FontWeight.w500,
              color: txtColor)
        ],
      ),
    ),
  );
}
