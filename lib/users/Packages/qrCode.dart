/// Dart import
import 'dart:async';
import 'dart:io';
import 'dart:ui' as dart_ui;

/// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:io';

/// Barcode import
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

/// Pdf import
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// open file library import

final GlobalKey<_BarcodeState> barcodeKey = GlobalKey();

///Export barcode class
class ExportQrcode extends StatefulWidget {
  List qrCodeData;
  ExportQrcode({key, required this.qrCodeData}) : super(key: key);

  @override
  _ExportQrcodeState createState() => _ExportQrcodeState();
}

class _ExportQrcodeState extends State<ExportQrcode> {
  _ExportQrcodeState();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(

            // appBar: AppBar(
            //   title: const Text('Flutter barcode Export'),
            // ),
            body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
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
                      const Image(
                        image: AssetImage('assets/user_profile.png'),
                        width: 40,
                      ),
                      SizedBox(width: 10)
                    ],
                  ),
                  Container(
                    //   color: Colors.red,
                    // height: screenHeight,
                    height: 600,
                    width: 500,
                    child: Barcode(
                      key: barcodeKey,
                      qrCode: widget.qrCodeData,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      width: 150,
                      color: Colors.green,
                      child: IconButton(
                        onPressed: () {
                          /// Snackbar messanger to indicate that the rendered barcode is being exported as PDF
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 2000),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            content: Text(
                                'barcode is being exported as PDF document'),
                          ));
                          _renderPdf();
                        },
                        icon: Row(
                          children: const <Widget>[
                            Icon(Icons.picture_as_pdf, color: Colors.black),
                            Text('Export to pdf'),
                          ],
                        ),
                      )),
                ]),
          ),
        )),
      ),
    );
  }

  Future<void> _renderPdf() async {
    // Create a new PDF document.
    final PdfDocument document = PdfDocument();
    // Create a pdf bitmap for the rendered barcode image.
    final PdfBitmap bitmap = PdfBitmap(await _readImageData());
    // set the necessary page settings for the pdf document such as margin, size etc..
    document.pageSettings.margins.all = 0;
    document.pageSettings.size =
        Size(bitmap.width.toDouble(), bitmap.height.toDouble());
    // Create a PdfPage page object and assign the pdf document's pages to it.
    final PdfPage page = document.pages.add();
    // Retrieve the pdf page client size
    final Size pageSize = page.getClientSize();
    // Draw an image into graphics using the bitmap.
    // page.graphics.drawImage(
    //   bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));

    page.graphics.drawImage(
        bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));

    // Snackbar indication for barcode export operation
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      duration: Duration(milliseconds: 200),
      content: Text('Qr Code are exported as PDF document.'),
    ));
    //Save and dispose the document.

    //Get the external storage directory.
    Directory directory = (await getApplicationDocumentsDirectory());
    //Get the directory path.
    String path = directory.path;
    //Create an empty file to write the PDF data.
    final file = File('$path/output.pdf');
    await file.writeAsBytes(await document.save());
    var _openResult = 'Unknown';

    // File file = File('$path/output.pdf');
    //Write the PDF data.

    // await file.writeAsBytes(bytes as List<int>, flush: true);
    //Open the PDF document on mobile.
    OpenFilex.open('$path/output.pdf');
  }

  /// Method to read the rendered barcode image and return the image data for processing.
  Future<List<int>> _readImageData() async {
    final dart_ui.Image data =
        await barcodeKey.currentState!.convertToImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: dart_ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }
}

class Barcode extends StatefulWidget {
  List qrCode;
  Barcode({key, required this.qrCode}) : super(key: key);

  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  @override
  Widget build(BuildContext context) {
    // final List<Map> myBarCode = widget.qrCode;
    // List.generate(100000, (index) => {"id": index, "name": "$index"})
    //     .toList();

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 1,
            crossAxisSpacing: 60,
            mainAxisSpacing: 10),
        itemCount: widget.qrCode.length,
        itemBuilder: (BuildContext ctx, index) {
          return RepaintBoundary(
              child: Card(
            elevation: 2,
            child: Center(
              child: Container(
                height: 180,
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: QrImage(
                  data: widget.qrCode[index],
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                //  SfBarcodeGenerator(
                //     //value: 'CODE128',
                //     //   value: index.toString(),
                //     value: myBarCode[index]["name"],
                //     showValue: true,
                //     symbology: Code128(module: 2)),
              ),
            ),
          ));
        });
  }

  Future<dart_ui.Image> convertToImage({double pixelRatio = 1.0}) async {
    // Get the render object from context and store in the RenderRepaintBoundary onject.
    final RenderRepaintBoundary boundary =
        context.findRenderObject() as RenderRepaintBoundary;

    // Convert the repaint boundary as image
    final dart_ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);

    return image;
  }
}
