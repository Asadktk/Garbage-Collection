import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/api/adminApis/apiPost.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../Controller/packges_controller.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

PackgeController _con = PackgeController();

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController truckRegnoEditingController = TextEditingController();
  TextEditingController truckNameEditingController = TextEditingController();
  void clearText() {
    truckRegnoEditingController.clear();
    truckNameEditingController.clear();
  }

  bool isloading = true;
  List<String> seletCity = [];
  String? city;

  void initState() {
    _con.getCityDropDownDataController().then((value) {
      setState(() {
        for (int i = 0; i < _con.cityDropDown.length; i++) {
          seletCity.add(_con.cityDropDown[i].city.toString());
          print(seletCity);
        }
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return isloading == true
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ))
        : SafeArea(
            top: true,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/second.jpg'),
                            fit: BoxFit.cover)),
                  ),

                  // Back Arrow Button
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 90)),
                      Center(
                        child: textWidget(
                            title: "Add Vehicle",
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
                      textField(
                        textController: truckNameEditingController,
                        width: width,
                        //  height: height,
                        text: "Add Truck Name",
                        icon: Icon(Icons.location_city_outlined),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      textField(
                        textController: truckRegnoEditingController,
                        width: width,
                        //  height: height,
                        text: "Add Truck Reg.No",
                        icon: Icon(Icons.location_city_outlined),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      // textField(
                      //   textController: blockNameEditingController,
                      //   width: width,
                      //   //  height: height,
                      //   text: "Add Vehicle",
                      //   icon: Icon(Icons.location_city_outlined),
                      // ),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                          onTap: () {
                            AdminApiPost.AddVehicle(
                              Vehicle_name: truckNameEditingController.text,
                              Vehicle_regno: truckRegnoEditingController.text,
                              city: city,
                              context: context,
                            );
                            clearText();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const AddVehicle()),
                            // );
                          },
                          child: button(
                              title: "Add Vehicle",
                              width: width * 0.8,
                              fsize: 24.0,
                              height: height * 0.05,
                              bgColor: Colors.green,
                              txtColor: Colors.white)),
                    ],
                  )
                ],
              ),
            ));
  }
}
