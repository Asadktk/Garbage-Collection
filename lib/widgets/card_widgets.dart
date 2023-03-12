import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/text.dart';

Widget CardWidget({var image, var text, width, height}) {
  return Container(
    height: height,
    width: width,
    child: Card(
      elevation: 30,
      margin: EdgeInsets.all(20.0),
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('$image', width: 40),
            textWidget(
                title: text,
                fsize: 18.0,
                fweight: FontWeight.bold,
                color: Colors.black),
          ],
        ),
      ),
    ),
  );
}
