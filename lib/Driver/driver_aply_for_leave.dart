import 'package:flutter/material.dart';
import 'package:garbage_collection/widgets/text.dart';

class DriverApplyForLeave extends StatefulWidget {
  const DriverApplyForLeave({Key? key}) : super(key: key);

  @override
  State<DriverApplyForLeave> createState() => _DriverApplyForLeaveState();
}

class _DriverApplyForLeaveState extends State<DriverApplyForLeave> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fourth.jpg'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                ],
              ),
              Center(
                child: textWidget(
                    title: "Driver Apply For Leave",
                    fsize: 25.0,
                    fweight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
