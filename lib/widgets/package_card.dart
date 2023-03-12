import 'package:flutter/material.dart';
import 'package:garbage_collection/Controller/packges_controller.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';

PackgeController _con = PackgeController();

Widget PackageCard(var validate,
    {var icon,
    var packagename,
    var recycler,
    var nonrecyler,
    var price,
    var buttontxt,
    height,
    width,
    fsize,
    txtColor,
    var packgeID,
    userId}) {
  return Card(
    shadowColor: Color.fromARGB(255, 250, 254, 249),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Color.fromARGB(255, 236, 249, 217),
    elevation: 5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          height: height * 0.3,
          width: width * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Center(
                  child: icon,
                ),

                textWidget(
                    title: packagename,
                    fsize: 27.0,
                    fweight: FontWeight.bold,
                    color: Colors.black),
                textWidget(
                    title: recycler,
                    fsize: 20.0,
                    fweight: FontWeight.normal,
                    color: Colors.black),
                textWidget(
                    title: nonrecyler,
                    fsize: 20.0,
                    fweight: FontWeight.normal,
                    color: txtColor),
                // textWidget(
                //     title: validate,
                //     fsize: 20.0,
                //     fweight: FontWeight.normal,
                //     color: Colors.black),
                textWidget(
                    title: price,
                    fsize: 20.0,
                    fweight: FontWeight.normal,
                    color: Colors.black),
                InkWell(
                  onTap: () {
                    print('ontap');
                    print("UserId" + userId);
                    //var userId = 2;
                    // print("user id" + LoginApi.packgeID.toString());
                    _con.postUserPackage(packgeID: packgeID, userId: userId);
                  },
                  child: button(
                      title: buttontxt,
                      width: width * 0.9,
                      fsize: 21.0,
                      height: height * 0.05,
                      bgColor: Colors.green,
                      txtColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
