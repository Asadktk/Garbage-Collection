import 'package:flutter/cupertino.dart';

Widget textWidget({var title, var color, var fsize, var fweight}) {
  return Text(
    title,
    textAlign: TextAlign.start,
    // textAlign: TextAlign.start,
    style: TextStyle(color: color, fontSize: fsize, fontWeight: fweight),
  );
}
