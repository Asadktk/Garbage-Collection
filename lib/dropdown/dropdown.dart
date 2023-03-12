import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../Controller/packges_controller.dart';

class CustomDropDown extends StatefulWidget {
  // final String text;
  // final List dropDown;
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

PackgeController _con = PackgeController();

class _CustomDropDownState extends State<CustomDropDown> {
  bool isloading = true;
  List<String> seletArea = [];
  // String? city;
  // List<String> seletCity = [
  //   'Islamabad',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];
  // var seletArea = [
  //   'Shamsabad',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  void initState() {
    _con.getAreaDropDownDataController().then((value) {
      setState(() {
        for (int i = 0; i < _con.areaDropDown.length; i++) {
          seletArea.add(_con.areaDropDown[i].area.toString());
          print(seletArea);
        }
        isloading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String? area;

    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 225, 240, 182),
        ),
        height: height * 0.06,
        width: width * 0.8,
        child: CustomDropdownButton2(
          dropdownWidth: width * 0.87,
          // buttonWidth: 500,
          icon: const Icon(Icons.arrow_drop_down, size: 35),
          buttonDecoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          hint: 'Select Area',
          dropdownItems: seletArea,
          value: area,
          onChanged: (value) {
            setState(() {
              area = value;
            });
          },
        ),
      ),
    );
  }
}
