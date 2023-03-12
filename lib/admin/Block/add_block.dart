import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/apiPost.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../Controller/packges_controller.dart';

class AddBlock extends StatefulWidget {
  const AddBlock({Key? key}) : super(key: key);

  @override
  State<AddBlock> createState() => _AddBlockState();
}

// PackgeController _con = PackgeController();

class _AddBlockState extends State<AddBlock> {
  // TextEditingController cityEditingController = TextEditingController();
  TextEditingController areaEditingController = TextEditingController();
  TextEditingController blockNameEditingController = TextEditingController();
  // TextEditingController priceEditingController = TextEditingController();
  bool isloading = true;
  List<String> seletCity = [
    "Islamabad",
    "Rawalpindi",
    "Lahore",
    "Multan",
    "Karachi"
  ];
  List<String> seletArea = [];

  String? city;
  // String? area;

  // void initState() {
  //   // _con.getCityDropDownDataController().then((value) {
  //   //   setState(() {
  //   //     for (int i = 0; i < _con.cityDropDown.length; i++) {
  //   //       seletCity.add(_con.cityDropDown[i].city.toString());
  //   //       print(seletCity);
  //   //     }
  //   //     isloading = false;
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // return isloading == true
    //     ? const Center(
    //         child: CircularProgressIndicator(
    //         color: Colors.green,
    //       ))
    //     :
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/second.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width * 0.95,
                    // color: Colors.amber,
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
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 90)),
                      Center(
                        child: textWidget(
                            title: "Add Block",
                            color: Colors.black,
                            fsize: 30.0,
                            fweight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 225, 240, 182),
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
                          hint: "Select Your City",
                          dropdownItems: seletCity,
                          value: city,
                          onChanged: (value) {
                            setState(() {
                              city = value;
                              hint:
                              city;
                              print('city $city');

                              // _con
                              //     .getAreaDropDownDataController(
                              //         city: city)
                              //     .then((value) {
                              //   seletArea.clear();
                              //   setState(() {
                              //     for (int i = 0;
                              //         i < _con.areaDropDown.length;
                              //         i++) {
                              //       seletArea.add(_con
                              //           .areaDropDown[i].area
                              //           .toString());
                              //       print(seletArea);
                              //     }
                              //     isloading = false;
                              //   });
                              // });
                            });
                          },
                        ),
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 16, vertical: 8),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: Colors.green,
                      //       width: 2,
                      //     ),
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: const Color.fromARGB(255, 225, 240, 182),
                      //   ),
                      //   height: height * 0.06,
                      //   width: width * 0.8,
                      //   child: CustomDropdownButton2(
                      //     dropdownWidth: width * 0.87,
                      //     // buttonWidth: 500,
                      //     icon:
                      //         const Icon(Icons.arrow_drop_down, size: 35),
                      //     buttonDecoration: BoxDecoration(
                      //       border: Border.all(color: Colors.transparent),
                      //     ),
                      //     hint: "Select Your Area",
                      //     dropdownItems: seletArea,
                      //     value: area,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         area = value;
                      //       });
                      //     },
                      //   ),
                      // ),
                      textField(
                        textController: areaEditingController,
                        width: width,
                        //  height: height,
                        text: "Add Area",
                        icon: Icon(Icons.location_city_outlined),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      textField(
                        textController: blockNameEditingController,
                        width: width,
                        //  height: height,
                        text: "Add Block",
                        icon: Icon(Icons.location_city_outlined),
                      ),
                      // SizedBox(
                      //   height: height * 0.02,
                      // ),
                      // textField(
                      //   textController: priceEditingController,
                      //   width: width,
                      //   //  height: height,
                      //   text: "Price",
                      //   icon: Icon(Icons.location_city_outlined),
                      // ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                          onTap: () {
                            AdminApiPost.AddBlock(
                                City: city,
                                Area: areaEditingController.text,
                                Block_name: blockNameEditingController.text,
                                context: context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const AddBlock()),
                            // );
                          },
                          child: button(
                              title: "Add Block",
                              width: width * 0.8,
                              fsize: 24.0,
                              height: height * 0.05,
                              bgColor: Colors.green,
                              txtColor: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
