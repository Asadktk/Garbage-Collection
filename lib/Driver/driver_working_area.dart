import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_collection/Models/all_user_map_data_driver.dart';
import 'package:garbage_collection/api/adminApis/apiGet.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/SignupLogin/login.dart';

// class DriverWorkingArea extends StatefulWidget {
//   const DriverWorkingArea({Key? key}) : super(key: key);

//   @override
//   State<DriverWorkingArea> createState() => _DriverWorkingAreaState();
// }

// AdminApiGetRequest request = AdminApiGetRequest();
// UserMapLocationModel userMapLocationModel = UserMapLocationModel();
// List<String> markerLocation = [];
// List<UserMapLocationModel> userMapLocationModelData = <UserMapLocationModel>[];

// class _DriverWorkingAreaState extends State<DriverWorkingArea> {
//   final Completer<GoogleMapController> _controller = Completer();
//   static const CameraPosition _kGoogle = CameraPosition(
//     target: LatLng(20.42796133580664, 80.885749655962),
//     zoom: 14.4746,
//   );

//   final List<Marker> _markers = <Marker>[
//     Marker(
//         markerId: MarkerId('1'),
//         //   position: LatLng(20.42796133580664, 75.885749655962),
//         position: userMapLocationModelData.isEmpty
//             ? LatLng(20.42796133580664, 75.885749655962)
//             : LatLng(double.parse('${userMapLocationModelData[0].latitude}'),
//                 double.parse('${userMapLocationModelData[0].longitude}')),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),
//   ];
//   @override
//   initState() {
//     mapDataRepo();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: GoogleMap(
//           // on below line setting camera position
//           initialCameraPosition: _kGoogle,
//           // on below line we are setting markers on the map
//           markers: Set<Marker>.of(_markers),
//           //  on below line specifying controller on map complete.
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//     );
//   }

//   Future<dynamic> getAllUserMapdata() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var User_id = pref.getString("User_id");
//     try {
//       var response = await http.get(Uri.parse(
//           'http://${LoginApi.mainIP}/Fyp1api/api/Driver/usersgetlocation?User_id=$User_id'));

//       // print('Days For ${data}');

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         return data;
//       }
//     } catch (e) {
//       throw (e.toString());
//     }
//   }

//   mapDataRepo() {
//     request.getAllUserMapdata().then((respoce) {
//       print(respoce[0]['Longitude'].toString());
//       respoce.forEach((element) {
//         userMapLocationModelData.add(UserMapLocationModel.fromJson(element));
//       });
//       //  userMapLocationModel = UserMapLocationModel.fromJson(respoce);
//       // print('latitusdiad${userMapLocationModelData[0].latitude.toString()}');
//     });
//     //  print('latitude${userMapLocationModelData[0].latitude}');
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/button_widgets.dart';

class DriverWorkingArea extends StatefulWidget {
  const DriverWorkingArea({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverWorkingArea> createState() => _DriverWorkingArea();
}

List<UserMapLocationModel> userMapLocationModelData = <UserMapLocationModel>[];

var currentLocation;
//UserMapLocationModel userMapLocationModel = UserMapLocationModel();
AdminApiGetRequest request = AdminApiGetRequest();

class _DriverWorkingArea extends State<DriverWorkingArea> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: userMapLocationModelData.isEmpty
            ? LatLng(20.42796133580664, 75.885749655962)
            : LatLng(double.parse('${userMapLocationModelData[0].latitude}'),
                double.parse('${userMapLocationModelData[0].longitude}')),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    mapDataRepo();
    super.initState();
  }
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  // on below line setting camera position
                  initialCameraPosition: _kGoogle,
                  // on below line we are setting markers on the map
                  markers: Set<Marker>.of(_markers),
                  // on below line specifying map type.
                  mapType: MapType.normal,
                  // on below line setting user location enabled.
                  myLocationEnabled: true,
                  // on below line setting compass enabled.
                  compassEnabled: true,
                  // on below line specifying controller on map complete.
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 680.0),
                  child: InkWell(
                    onTap: () {
                      getUserCurrentLocation().then((value) async {
                        // print("latlong ${value.latitude} ${value.longitude}");
                        // widget.onItemPressed(value.latitude.toString(),
                        //     value.longitude.toString());
                        // marker added for current users location
                        _markers.add(Marker(
                          markerId: const MarkerId("2"),
                          position: LatLng(value.latitude, value.longitude),
                          infoWindow: const InfoWindow(
                            title: 'My Current Location',
                          ),
                        ));

                        // specified current users location
                        CameraPosition cameraPosition = CameraPosition(
                          target: LatLng(value.latitude, value.longitude),
                          zoom: 14,
                        );

                        final GoogleMapController controller =
                            await _controller.future;
                        controller.animateCamera(
                            CameraUpdate.newCameraPosition(cameraPosition));
                        setState(() {});
                      });
                    },
                    child: Center(
                      child: button(
                          title: "Get Location",
                          width: width * 0.4,
                          fsize: 24.0,
                          height: height * 0.06,
                          bgColor: Colors.green,
                          txtColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  mapDataRepo() {
    request.getAllUserMapdata().then((respoce) {
      print(respoce[0]['Longitude'].toString());
      respoce.forEach((element) {
        userMapLocationModelData.add(UserMapLocationModel.fromJson(element));
      });
      //  userMapLocationModel = UserMapLocationModel.fromJson(respoce);
      // print('latitusdiad${userMapLocationModelData[0].latitude.toString()}');
    });
    //  print('latitude${userMapLocationModelData[0].latitude}');
  }
}
