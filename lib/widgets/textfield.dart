import 'package:flutter/material.dart';

Widget textField({
  var text,
  var icon,
  width,
  textController,
  // height,
}) {
  return Container(
    width: width * 0.8,
    // height: height,
    child: TextField(
      //enabled: false,
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 6),
        hintText: text,
        prefixIcon: icon,
        fillColor: Color.fromARGB(255, 225, 240, 182),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Color.fromARGB(255, 72, 171, 59)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Color.fromARGB(255, 173, 185, 179)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
