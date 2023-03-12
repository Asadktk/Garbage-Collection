import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garbage_collection/users/Packages/qrCode.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/package_card.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/packges_controller.dart';
import '../../../Models/user_mypackage.dart';
import '../../../api/userapi/apiGet.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../api/userapi/apiPut_user.dart';

class MyPackages extends StatefulWidget {
  const MyPackages({Key? key}) : super(key: key);

  @override
  State<MyPackages> createState() => _MyPackagesState();
}

PackgeController _con = PackgeController();
var Userid;

class _MyPackagesState extends State<MyPackages> {
  var qty = 0;
  void initState() {
    // _con.getGarbageRequestStatusController(uid: UserId);
    GetType();
    super.initState();
  }

  void add() {
    setState(() {
      qty++;
    });
  }

  void Sub() {
    setState(() {
      qty--;
    });
  }

  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      Userid = pref.getString('User_id');
      // print(Utype);
      print('ds${Userid}');
    });
  }
  // QrImage(
  //   data: tokenEditingController.text,
  //   version: QrVersions.auto,
  //   size: 200.0,
  // ),
  // textField(
  //   textController: tokenEditingController,
  //   width: width,
  //   text: "Enter Value ",
  //   icon: Icon(Icons.people_alt),
  // ),
  // ElevatedButton(
  //     onPressed: () {
  //       setState(() {});
  //     },
  //     child: Text('Generat Token')),

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List token = [];
    List<String> qrcodeValue = [];
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                        onPressed: () => Navigator.of(context).pop(null),
                      ),
                      SizedBox(width: 300),
                      Image(
                        image: AssetImage('assets/user_profile.png'),
                        width: 40,
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                textWidget(
                    title: "My Package",
                    fsize: 30.0,
                    fweight: FontWeight.w500,
                    color: Colors.black),
                FutureBuilder(
                    future: _con.userPackagesListController(),
                    builder:
                        (context, AsyncSnapshot<List<MyPackage>> snapshop) {
                      if (!snapshop.hasData) {
                        return Text("Loading...!");
                      } else {
                        List<MyPackage> data = snapshop.data!;
                        return Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          height: height * 0.3,
                          width: width * 95,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shadowColor: Color.fromARGB(255, 34, 35, 34),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Color.fromARGB(255, 236, 249, 217),
                                  elevation: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10.0),
                                        height: height * 0.3,
                                        width: width * 0.88,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0, left: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.crown,
                                                  size: 35,
                                                  color: Color.fromARGB(
                                                      255, 253, 213, 12),
                                                ),
                                              ),

                                              textWidget(
                                                  title:
                                                      'Recycler: ${data[index].recycleBag}',
                                                  fsize: 20.0,
                                                  fweight: FontWeight.w400,
                                                  color: Colors.black),
                                              textWidget(
                                                  title:
                                                      'Recycler: ${data[index].nonrecycleBag}',
                                                  fsize: 20.0,
                                                  fweight: FontWeight.w400,
                                                  color: Colors.black),
                                              InkWell(
                                                onTap: () {
                                                  UserPutApi().userMissingToken(
                                                      uid: Userid);
                                                },
                                                child: button(
                                                    title:
                                                        "Complaint Missing Token",
                                                    bgColor: Colors.green,
                                                    txtColor: Colors.white,
                                                    fsize: 20.0,
                                                    width: width * 0.9,
                                                    height: height * 0.05),
                                              )
                                              // textWidget(
                                              //     title: packagename,
                                              //     fsize: 27.0,
                                              //     fweight: FontWeight.bold,
                                              //     color: Colors.black),
                                              // textWidget(
                                              //     title: recycler,
                                              //     fsize: 20.0,
                                              //     fweight: FontWeight.normal,
                                              //     color: Colors.black),
                                              // textWidget(
                                              //     title: nonrecyler,
                                              //     fsize: 20.0,
                                              //     fweight: FontWeight.normal,
                                              //     color: txtColor),
                                              // textWidget(
                                              //     title: validate,
                                              //     fsize: 20.0,
                                              //     fweight: FontWeight.normal,
                                              //     color: Colors.black),
                                              // textWidget(
                                              //     title: price,
                                              //     fsize: 20.0,
                                              //     fweight: FontWeight.normal,
                                              //     color: Colors.black),
                                              // InkWell(
                                              //   onTap: () {
                                              //     print('ontap');
                                              //     print("UserId" + userId);
                                              //     //var userId = 2;
                                              //     // print("user id" + LoginApi.packgeID.toString());
                                              //     _con.postUserPackage(packgeID: packgeID, userId: userId);
                                              //   },
                                              //   child: button(
                                              //       title: buttontxt,
                                              //       width: width * 0.9,
                                              //       fsize: 21.0,
                                              //       height: height * 0.05,
                                              //       bgColor: Colors.green,
                                              //       txtColor: Colors.white),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                                // PackageCard(
                                //   icon: const FaIcon(
                                //     FontAwesomeIcons.crown,
                                //     size: 35,
                                //     color: Color.fromARGB(255, 253, 213, 12),
                                //   ),
                                //   packagename: 'My Tokens',
                                //   recycler:
                                //       'Recycler: ${data[index].recycleBag}',
                                //   nonrecyler:
                                //       'Non-Recycler: ${data[index].nonrecycleBag}',
                                //   'Validity: 30 Days',
                                //   price: '',
                                //   buttontxt: "Unsubscribe",
                                //   height: height,
                                //   width: width,
                                // );

                                //  AdminCard(
                                //   txtname:
                                //       '${data[index].packageName}',
                                //   txtcity:
                                //       'Recycler: ${data[index].recycleBag}',
                                //   txtarea:
                                //       'Non-Recycler: ${data[index].nonrecycleBag}',
                                //   txtblock:
                                //       'Price: ${data[index].price}',
                                //   width: width * 1.6,
                                //   height: height * 0.2,
                                //   fsize: 18.0,
                                //   txtColor: Colors.black,
                                // );
                              }),
                        );
                      }
                    }),
                SizedBox(
                  height: height * 0.3,
                ),

                Container(
                  width: width * 0.8,
                  height: height * 0.05,
                  color: Colors.green[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                          title: qty.toString(),
                          fsize: 30.0,
                          fweight: FontWeight.w500,
                          color: Colors.black),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () => add(),
                        child: button(
                            title: "+",
                            fsize: 20.0,
                            width: width * 0.2,
                            height: height * 0.04,
                            bgColor: Color.fromARGB(255, 243, 236, 236)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () => Sub(),
                        child: button(
                            title: "-",
                            fsize: 20.0,
                            width: width * 0.2,
                            height: height * 0.04,
                            bgColor: Color.fromARGB(255, 243, 236, 236)),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                    ],
                  ),
                ),
                // List<MyPackage> dat = [];
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    UserApiGetRequest()
                        .getUserMyToken(userid: Userid)
                        .then((value) {
                      for (int i = 0; i < value.length; i++) {
                        qrcodeValue.add('${value[i]['Token_no']}');
                      }
                      print(qrcodeValue.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExportQrcode(
                                  qrCodeData: qrcodeValue,
                                )),
                      );
                    });
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        button(
                            title: "Generate QrCode",
                            bgColor: Colors.green,
                            txtColor: Color.fromARGB(255, 253, 251, 251),
                            fsize: 22.0,
                            width: width * 0.9,
                            height: height * 0.05),
                      ],
                    ),
                  ),
                )
              ]))),
    );
  }
}

Widget qrCode({qrCode}) {
  print("qrCode $qrCode");
  return QrImage(
    data: qrCode.toString(),
    version: QrVersions.auto,
    size: 200.0,
  );
}
