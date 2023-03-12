import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../api/adminApis/apiPost.dart';
// /
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:dio/dio.dart';
// import 'package:garbage_collection/users/pages/user_dashboard.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class AddPackage extends StatefulWidget {
  const AddPackage({Key? key}) : super(key: key);

  @override
  State<AddPackage> createState() => _AddPackageState();
}

class _AddPackageState extends State<AddPackage> {
  TextEditingController packageNameEditingController = TextEditingController();
  TextEditingController recyclerEditingController = TextEditingController();
  TextEditingController nonRecyclerEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  void clearText() {
    packageNameEditingController.clear();
    recyclerEditingController.clear();
    nonRecyclerEditingController.clear();
    priceEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
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
                        title: "Add Package",
                        color: Colors.black,
                        fsize: 30.0,
                        fweight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: packageNameEditingController,
                    width: width,
                    //  height: height,
                    text: "Add Package Name",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: recyclerEditingController,
                    width: width,
                    //  height: height,
                    text: "Recyclere",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: nonRecyclerEditingController,
                    width: width,
                    //  height: height,
                    text: "Non Recyclere",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: priceEditingController,
                    width: width,
                    //  height: height,
                    text: "Price",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                      onTap: () {
                        AdminApiPost.AddPackages(
                            Package_name: packageNameEditingController.text,
                            Nonrecycle_bag: nonRecyclerEditingController.text,
                            Recycle_bag: recyclerEditingController.text,
                            price: priceEditingController.text,
                            context: context);
                        clearText();
                      },
                      child: button(
                          title: "Add Package",
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




//Dio dio = Dio();

// Future<String> AddPackages({
//   // ignore: non_constant_identifier_names
//   Package_name,
//   Recycle_bag,
//   Nonrecycle_bag,
//   price,
//   context,
// }) async {
//   // isloading:true;
//   var apiURL = 'http://192.168.56.1/Fyp1api/api/Admin/Addpkg';

//   var formData = FormData.fromMap({
//     'Package_name': Package_name,
//     'Recycle_bag': Recycle_bag,
//     'Nonrecycle_bag': Nonrecycle_bag,
//     'price': price,
//   });

//   //final prefs = await SharedPreferences.getInstance();
//   Response responce;

//   try {
//     responce = await dio.post(apiURL,
//         data: formData,
//         options: Options(headers: {
//           "content-type": "application/json",
//           "accept": "application/json",
//         }));
//     // SharedPreferences pref = await SharedPreferences.getInstance();
//     // var res1 = responce.data['user'];
//     // var role = res1['role'];
//     // var token = res1['token'];
//     // print(token);
//     // print(role);
//     // pref.setString("token", token);
//     // pref.setString("role", role);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const UserDashBoard()),
//     );
//     return responce.data;
//   } catch (e) {
//     Fluttertoast.showToast(
//         msg: "User Already exists ", backgroundColor: Colors.cyan);
//     return "";
//   }
// }
