import 'package:flutter/material.dart';
import 'package:garbage_collection/admin/Block/all_block.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

class UpdateBlock extends StatefulWidget {
  const UpdateBlock({Key? key}) : super(key: key);

  @override
  State<UpdateBlock> createState() => _UpdateBlockState();
}

class _UpdateBlockState extends State<UpdateBlock> {
  TextEditingController packageNameEditingController = TextEditingController();
  TextEditingController recyclerEditingController = TextEditingController();
  TextEditingController nonRecyclerEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();

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
                        title: "UpDate Block",
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
                    text: "Add City",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: recyclerEditingController,
                    width: width,
                    //  height: height,
                    text: "Add Area",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textField(
                    textController: nonRecyclerEditingController,
                    width: width,
                    //  height: height,
                    text: "Add Block",
                    icon: Icon(Icons.location_city_outlined),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllBlock()),
                        );
                      },
                      child: button(
                          title: "Update Block",
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
