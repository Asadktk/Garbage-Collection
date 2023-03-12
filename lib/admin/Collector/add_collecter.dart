import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../Controller/packges_controller.dart';
import '../../api/SignupLogin/signup.dart';

class AddCollector extends StatefulWidget {
  const AddCollector({Key? key}) : super(key: key);

  @override
  State<AddCollector> createState() => _AddCollectorState();
}

PackgeController _con = PackgeController();

class _AddCollectorState extends State<AddCollector> {
  bool isloading = true;
  List<String> seletCity = [];
  List<String> seletArea = [];
  String? city;
  String? area;

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

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController phonenoEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController areaEditingController = TextEditingController();
  TextEditingController blockEditingController = TextEditingController();
  TextEditingController streetEditingController = TextEditingController();
  TextEditingController housenoEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return isloading == true
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ))
        : Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/second.jpg'), fit: BoxFit.cover)),
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // InkWell(
                    //     onTap: () => Navigator.pop(context),
                    //     child: Icon(Icons.arrow_back)),
                    // IconButton(
                    //   padding: EdgeInsets.only(left: 20.0),
                    //   icon: Icon(
                    //     Icons.arrow_back_ios,
                    //     size: 29,
                    //   ),
                    //   onPressed: () {
                    //     // Navigator.of(context).pop();
                    //     Navigator.pop(context);
                    //     print("object");
                    //   },
                    // ),

                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 40,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textWidget(
                              title: "Add Collector",
                              color: Colors.black,
                              fsize: 30.0,
                              fweight: FontWeight.w500),
                          Container(
                            // color: Colors.amber,

                            height: height * 0.9,
                            width: width * 0.85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textField(
                                  textController: nameEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Driver Name",
                                  icon: Icon(Icons.person),
                                ),
                                textField(
                                  textController: usernameEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Driver Username",
                                  icon: Icon(Icons.person),
                                ),
                                textField(
                                  textController: emailEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Email",
                                  icon: Icon(Icons.email),
                                ),
                                textField(
                                  textController: phonenoEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Phone no.",
                                  icon: Icon(Icons.email),
                                ),
                                textField(
                                  textController: passwordEditingController,
                                  width: width,
                                  //  height: height,
                                  text: "Password",
                                  icon: Icon(Icons.remove_red_eye),
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
                                    color: const Color.fromARGB(
                                        255, 225, 240, 182),
                                  ),
                                  height: height * 0.06,
                                  width: width * 0.8,
                                  child: CustomDropdownButton2(
                                    dropdownWidth: width * 0.87,
                                    // buttonWidth: 500,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        size: 35),
                                    buttonDecoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.transparent),
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

                                        _con
                                            .getAreaDropDownDataController(
                                                city: city)
                                            .then((value) {
                                          seletArea.clear();
                                          setState(() {
                                            for (int i = 0;
                                                i < _con.areaDropDown.length;
                                                i++) {
                                              seletArea.add(_con
                                                  .areaDropDown[i].area
                                                  .toString());
                                              print(seletArea);
                                            }
                                            isloading = false;
                                          });
                                        });
                                        ;
                                      });
                                    },
                                  ),
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
                                    color: const Color.fromARGB(
                                        255, 225, 240, 182),
                                  ),
                                  height: height * 0.06,
                                  width: width * 0.8,
                                  child: CustomDropdownButton2(
                                    dropdownWidth: width * 0.87,
                                    // buttonWidth: 500,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        size: 35),
                                    buttonDecoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    hint: "Select Your Area",
                                    dropdownItems: seletArea,
                                    value: area,
                                    onChanged: (value) {
                                      setState(() {
                                        area = value;
                                      });
                                    },
                                  ),
                                ),
                                textField(
                                  textController: streetEditingController,
                                  width: width,
                                  //  height: height,
                                  text: "Street Number",
                                  icon: Icon(Icons.streetview_outlined),
                                ),
                                textField(
                                  textController: housenoEditingController,
                                  width: width,
                                  //  height: height,
                                  text: "House Number",
                                  icon: Icon(Icons.house_rounded),
                                ),
                                InkWell(
                                    onTap: () {
                                      Register(
                                          Name: nameEditingController.text
                                              .toString(),
                                          Username: usernameEditingController
                                              .text
                                              .toString(),
                                          Email: emailEditingController.text
                                              .toString(),
                                          Phoneno: phonenoEditingController.text
                                              .toString(),
                                          Pasword: passwordEditingController
                                              .text
                                              .toString(),
                                          city: city.toString(),
                                          area: area.toString(),
                                          Street: streetEditingController.text
                                              .toString(),
                                          HouseNo: housenoEditingController.text
                                              .toString(),
                                          Utype: 'Collector',
                                          long: '0',
                                          lat: '0',
                                          context: context);
                                      // _register();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => const SignIn()),
                                      // );
                                    },
                                    child: button(
                                        title: "Add Collector",
                                        width: width * 0.8,
                                        fsize: 24.0,
                                        height: height * 0.06,
                                        bgColor: Colors.green,
                                        txtColor: Colors.white)),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
  }
}
