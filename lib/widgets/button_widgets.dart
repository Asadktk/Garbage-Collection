import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/text.dart';

Widget button({title, width, height, fsize, bgColor, txtColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: bgColor,
    ),
    height: height,
    width: width,
    child: Center(
      child: textWidget(
          title: title,
          fsize: fsize,
          fweight: FontWeight.w500,
          color: txtColor),
    ),
  );
}
