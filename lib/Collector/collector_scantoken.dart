import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:garbage_collection/Models/scan_token_model.dart';
import 'package:garbage_collection/api/collectorApi/collector_put_api.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/text.dart';

class CollectorScanToken extends StatefulWidget {
  CollectorScanToken({
    Key? key,
  }) : super(key: key);

  @override
  State<CollectorScanToken> createState() => _CollectorScanTokenState();
}

//scanTokenModel scanModel = scanTokenModel();
var qrcode;
var getResult = 'Qr Code Result';
List<ScanTokenModel> scaneList = [];
//ScanTokenModel tokenModel = ScanTokenModel();

class _CollectorScanTokenState extends State<CollectorScanToken> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  CollectorPutApi scanToken = CollectorPutApi();
  Barcode? result;
  QRViewController? controller;
  var userId;

  bool isloading = false;
  void initState() {
    // _con.getGarbageRequestStatusController(uid: UserId);
    // GetType();
    super.initState();
    final date = DateTime.now();
    print('DateTime${date}');
  }

  // GetType() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     // Utype = pref.getString('Utype');
  //     qrcode = pref.getString('Token_no');
  //     // print(Utype);
  //     print('ds${qrcode}');
  //   });
  // }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  // TextEditingController tokenEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width * 0.95,
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
                    textWidget(
                        title: 'Scan Token',
                        fsize: 30.0,
                        fweight: FontWeight.w500,
                        color: Colors.black),
                    const SizedBox(
                      width: 29,
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  // color: Colors.amber,
                  width: width * 0.90,
                  height: height * 0.80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: QRView(
                          key: qrKey,
                          overlay: QrScannerOverlayShape(
                              borderColor: Colors.red,
                              borderLength: 20,
                              borderRadius: 10,
                              borderWidth: 10,
                              cutOutSize: 300),
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      ),
                      isloading == true
                          ? CircularProgressIndicator()
                          : Expanded(
                              flex: 1,
                              child: Center(
                                child: (result != null)
                                    ? Column(
                                        children: [
                                          Text(
                                              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'),

                                          // Text(
                                          //     'Barcode Type: ${scaneList[0].houseNo}   Data: ${result!.code}'),
                                          // Text(
                                          //     'Barcode Type: ${scaneList[0].blockName}   Data: ${result!.code}'),
                                        ],
                                      )
                                    : Text('Scan a code'),
                              ),
                            ),
                      //scan token view
                      // Container(
                      //   child: textWidget(),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print('dfsdfs${scanData.code}');
      setState(() {
        result = scanData;
        final now = DateTime.now();
        scanTokenRepo(token_no: '${result!.code}');
        // DateTime dateTime = DateTime.now();

        // isloading = true;
        //  scanToken.collectorScanToken(token_no: '${result!.code}');
      });
      // print('qrcode${result!.code.toString()}');
      // if (scanData.code.toString() == qrcode.toString()) {
      //   scanToken.collectorScanToken(token_no: qrcode);
      //   Navigator.pop(context);
      //   dispose();
      // } else {
      // Text('Qr not matched');
      // Fluttertoast.showToast(msg: 'Qr Not Matched..');
      // setState(() {
      //   result = scanData;
      // });
      //  }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  ScanTokenModel scan = ScanTokenModel();
  scanTokenRepo({token_no}) {
    scanToken.collectorScanToken(token_no: token_no).then((respoce) {
      //  scaneList.add(ScanTokenModel.fromJson(respoce));

      print('reasponce${respoce['User_name'].toString()}');
      //   print(respoce[0]['Longitude'].toString());
      ScanTokenModel.fromJson(respoce);
      print('UserName${scan.userName}');
    });
  }
}
