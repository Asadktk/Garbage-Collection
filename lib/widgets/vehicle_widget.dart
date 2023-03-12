import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/deleteApi.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:icon_decoration/icon_decoration.dart';

Widget VehiclesCard({
  var txtname,
  var txtregNo,
  var fsize,
  var txtColor,
  width,
  height,
}) {
  return Container(
    width: width,
    height: height,
    child: Card(
      color: Color.fromARGB(255, 244, 251, 234),
      elevation: 5,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      shadowColor: Color.fromARGB(255, 1, 224, 31),
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
                    AdminDeleteApi().deleteVehicle(reg: txtregNo);
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
            ],
          ),
          textWidget(
              title: txtname,
              fsize: fsize,
              fweight: FontWeight.w500,
              color: txtColor),
          textWidget(
              title: txtregNo,
              fsize: fsize,
              fweight: FontWeight.w500,
              color: txtColor),
        ],
      ),
    ),
  );
}
