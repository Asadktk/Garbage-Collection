import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/Controller/packges_controller.dart';
import 'package:garbage_collection/api/SignupLogin/signup.dart';
import 'package:garbage_collection/users/SignupLogin/signin.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';
import 'package:get/get.dart';

import '../../admin/Dashboard/admin_dashboard.dart';
import '../user_add_location.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

PackgeController _con = PackgeController();

class _SignUpState extends State<SignUp> {
  bool isloading = true;
  List<String> seletCity = [];
  List<String> seletArea = [];

  @override

  // ignore: must_call_super
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

    // _con.getAreaDropDownDataController().then((value) {
    //   setState(() {
    //     for (int i = 0; i < _con.areaDropDown.length; i++) {
    //       seletArea.add(_con.areaDropDown[i].area.toString());
    //       print(seletArea);
    //     }
    //     isloading = false;
    //   });
    // });
  }

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phonenoEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController streetEditingController = TextEditingController();
  TextEditingController housenoEditingController = TextEditingController();
  var UType = 'user';
  String? city;
  String? area;
  var latitude;
  var Longitude;
  validate() {
    if (nameEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Name", backgroundColor: Colors.cyan);
      return false;
    }
    if (usernameEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter username", backgroundColor: Colors.cyan);
      return false;
    }
    if (emailEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Email", backgroundColor: Colors.cyan);
      return false;
    }
    if (phonenoEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Phone Number", backgroundColor: Colors.cyan);
      return false;
    }
    if (passwordEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Password", backgroundColor: Colors.cyan);
      return false;
    }
    if (streetEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Street Number", backgroundColor: Colors.cyan);
      return false;
    }
    if (housenoEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter House Number", backgroundColor: Colors.cyan);
      return false;
    }
    // if (city == "") {
    //   Fluttertoast.showToast(
    //       msg: "Please Select City", backgroundColor: Colors.cyan);
    //   return false;
    // }
    // if (area == "") {
    //   Fluttertoast.showToast(
    //       msg: "Please Select Area", backgroundColor: Colors.cyan);
    //   return false;
    // }
    return true;
  }

  onItemPressed(String lat, String long) {
    print("$lat");
    print("$long");
    latitude = lat;
    Longitude = long;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // String? city;

    return isloading == true
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ))
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  //backgrond image
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/second.jpg'),
                            fit: BoxFit.cover)),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.8,
                          height: height * 0.1,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: textWidget(
                                    title: "Sign Up",
                                    color: Colors.black,
                                    fsize: 26.0,
                                    fweight: FontWeight.w500),
                              ),
                              textWidget(
                                  title: "Create Acount",
                                  color: Colors.black,
                                  fsize: 16.0,
                                  fweight: FontWeight.w500),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          height: height * 1,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment:EdgeInsets.only(top:10.0),
                              children: [
                                textField(
                                  textController: nameEditingController,
                                  width: width,
                                  // height: height * 0.05,
                                  text: "Your Name",
                                  icon: Icon(Icons.person),
                                ),
                                textField(
                                    textController: usernameEditingController,
                                    width: width,
                                    // height: height,
                                    text: "Your User Name",
                                    icon: Icon(Icons.person_pin)),
                                textField(
                                  textController: emailEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Email",
                                  icon: Icon(Icons.email),
                                ),
                                textField(
                                  textController: passwordEditingController,
                                  width: width,
                                  // height: height,
                                  text: "Password",
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                textField(
                                  textController: phonenoEditingController,
                                  width: width,
                                  //  height: height,
                                  text: "Phone No.",
                                  icon: Icon(Icons.phone),
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
                                  icon: const Icon(Icons.streetview_outlined),
                                ),
                                textField(
                                  textController: housenoEditingController,
                                  width: width,
                                  //  height: height,
                                  text: "House Number",
                                  icon: const Icon(Icons.house_rounded),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserAddLocation(
                                              onItemPressed: onItemPressed)),
                                    );
                                  },
                                  child: button(
                                      title: "Add Location",
                                      width: width * 0.8,
                                      fsize: 24.0,
                                      height: height * 0.05,
                                      bgColor: Colors.green,
                                      txtColor: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("Area $area");
                                    print("City $city");
                                    if (validate()) {
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
                                          Street: streetEditingController.text
                                              .toString(),
                                          HouseNo: housenoEditingController.text
                                              .toString(),
                                          city: city,
                                          area: area,
                                          Utype: UType,
                                          lat: latitude,
                                          long: Longitude,
                                          context: context);
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
                                          Street: streetEditingController.text
                                              .toString(),
                                          HouseNo: housenoEditingController.text
                                              .toString(),
                                          city: city.toString(),
                                          area: area.toString(),
                                          Utype: UType,
                                          context: context);
                                    }
                                  },
                                  child: button(
                                      title: "Signup",
                                      width: width * 0.8,
                                      fsize: 24.0,
                                      height: height * 0.05,
                                      bgColor: Colors.green,
                                      txtColor: Colors.white),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()),
                                      );
                                    },
                                    child: button(
                                        title: "Log In",
                                        width: width * 0.8,
                                        fsize: 24.0,
                                        height: height * 0.05,
                                        bgColor: Colors.green,
                                        txtColor: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
