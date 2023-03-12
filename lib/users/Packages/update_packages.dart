import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garbage_collection/widgets/package_card.dart';
import 'package:garbage_collection/widgets/text.dart';

class UpdatePackage extends StatefulWidget {
  const UpdatePackage({Key? key}) : super(key: key);

  @override
  State<UpdatePackage> createState() => _UpdatePackageState();
}

class _UpdatePackageState extends State<UpdatePackage> {
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
          body: Column(
            children: [
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
                    Image(
                      image: AssetImage('assets/user_profile.png'),
                      width: 40,
                    ),
                  ],
                ),
              ),
              textWidget(
                  title: "Update Package",
                  fsize: 30.0,
                  fweight: FontWeight.w500,
                  color: Colors.black),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                height: height * 0.35,
                width: width * 0.9,
                child: PackageCard(
                    icon: const FaIcon(
                      FontAwesomeIcons.crown,
                      size: 40,
                      color: Color.fromARGB(255, 93, 171, 82),
                    ),
                    packagename: 'Primium Plan',
                    recycler: 'Recycler :20',
                    nonrecyler: 'Non-Recyler',
                    'Validity: 45 Days',
                    price: 'Rs.500',
                    buttontxt: "Update Package",
                    height: height * 0.9,
                    width: width * 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
