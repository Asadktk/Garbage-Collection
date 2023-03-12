import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/button_widgets.dart';

class UserAddLocation extends StatefulWidget {
  final Function(String, String) onItemPressed;
  UserAddLocation({Key? key, required this.onItemPressed}) : super(key: key);

  @override
  State<UserAddLocation> createState() => _UserAddLocationState();
}

var currentLocation;

class _UserAddLocationState extends State<UserAddLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
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

  // @override
  // void initState() {
  //   _getLocation();
  //   super.initState();
  // }
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
                        widget.onItemPressed(value.latitude.toString(),
                            value.longitude.toString());
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
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: button(
                          title: "Add Location",
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
      // on pressing floating action button the camera will take to user current location
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     getUserCurrentLocation().then((value) async {
      //       print("${value.latitude} ${value.longitude}");
      //       widget.onTap('${value.latitude} ${value.longitude}');
      //       // marker added for current users location
      //       _markers.add(Marker(
      //         markerId: const MarkerId("2"),
      //         position: LatLng(value.latitude, value.longitude),
      //         infoWindow: const InfoWindow(
      //           title: 'My Current Location',
      //         ),
      //       ));

      //       // specified current users location
      //       CameraPosition cameraPosition = CameraPosition(
      //         target: LatLng(value.latitude, value.longitude),
      //         zoom: 14,
      //       );

      //       final GoogleMapController controller = await _controller.future;
      //       controller
      //           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       setState(() {});
      //     });

      //   },
      //   child: const Icon(Icons.local_activity),
      // ),
    );
  }
}
