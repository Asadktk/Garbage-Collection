import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/packges_controller.dart';
import '../../Models/all_garbagerequest_status_model.dart.dart';
import '../../api/userapi/apiPost.dart';

class GarbageRequest extends StatefulWidget {
  const GarbageRequest({Key? key}) : super(key: key);

  @override
  State<GarbageRequest> createState() => _GarbageRequestState();
}

var UserId;
// UserApiPost userApiPost = UserApiPost();
PackgeController _con = PackgeController();

class _GarbageRequestState extends State<GarbageRequest> {
  // TextEditingController nameEditingController = TextEditingController();
  // TextEditingController recyclerEditingController = TextEditingController();
  // TextEditingController nonRecyclerEditingController = TextEditingController();
  // TextEditingController priceEditingController = TextEditingController();

  void initState() {
    // _con.getGarbageRequestStatusController(uid: UserId);
    GetType();
    super.initState();
  }

  GetType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // Utype = pref.getString('Utype');
      UserId = pref.getString('User_id');
      // print(Utype);
      print('ds${UserId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int i = 0;
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
                        title: "Garbage Request",
                        color: Colors.black,
                        fsize: 30.0,
                        fweight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // textField(
                  //   textController: nameEditingController,
                  //   width: width,
                  //   //  height: height,
                  //   text: "enter your name",
                  //   icon: Icon(Icons.location_city_outlined),
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // textField(
                  //   textController: recyclerEditingController,
                  //   width: width,
                  //   //  height: height,
                  //   text: "City",
                  //   icon: Icon(Icons.location_city_outlined),
                  // ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // textField(
                  //   textController: nonRecyclerEditingController,
                  //   width: width,
                  //   //  height: height,
                  //   text: "Add Block",
                  //   icon: Icon(Icons.location_city_outlined),
                  // ),
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
                        if (i == 0) {
                          UserApiPost().sendUserGarbageRequest(userId: UserId);
                          i++;
                        } else {
                          Fluttertoast.showToast(
                              msg: "You Request already sended",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16.0);
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           UserApiPost().sendUserGarbageRequest()),
                        //           ),
                        // );
                      },
                      child: button(
                          title: "Send Request",
                          width: width * 0.8,
                          fsize: 24.0,
                          height: height * 0.05,
                          bgColor: Colors.green,
                          txtColor: Colors.white)),
                  SizedBox(height: 20),

                  textWidget(
                      title: "Request Status",
                      color: Colors.black,
                      fsize: 25.0,
                      fweight: FontWeight.w500),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future:
                          _con.getGarbageRequestStatusController(uid: UserId),
                      builder: (context,
                          AsyncSnapshot<List<UserGarbageRequestStatusModel>>
                              snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<UserGarbageRequestStatusModel> data =
                              snapshot.data!;
                          print(data.length);
                          return Container(
                            child: data.length == "0"
                                ? textWidget(
                                    //   title: data[0].status.toString(),
                                    title: data[0].status != 0
                                        ? "Request Accepted"
                                        : 'Request in Progress',
                                    color: Color.fromARGB(255, 134, 47, 47),
                                    fsize: 25.0,
                                    fweight: FontWeight.w500)
                                : const Text("No Request Found"),
                          );

                          //  ListView.builder(
                          //   itemCount: data.length,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Container(
                          //       height: 90,
                          //       child: textWidget(
                          //           title: "Status ${data[index].status}",
                          //           color: Color.fromARGB(255, 134, 47, 47),
                          //           fsize: 25.0,
                          //           fweight: FontWeight.w500),
                          //     );
                          //   },
                          // );

                        }
                      }),
                ],
              )
            ],
          ),
        ));
  }
}
