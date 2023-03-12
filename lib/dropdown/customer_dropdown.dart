import 'package:flutter/material.dart';

class CustomDropDownWigetState extends StatefulWidget {
  const CustomDropDownWigetState({Key? key}) : super(key: key);

  @override
  State<CustomDropDownWigetState> createState() =>
      _CustomDropDownWigetStateState();
}

class _CustomDropDownWigetStateState extends State<CustomDropDownWigetState> {
  String selectOption = "Select Option";
  bool isOpen = false;
  List<String> collector = ['Ali', 'kamran', 'sultan', 'Farhan'];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height * 0.3,
        width: width * 0.95,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  isOpen = !isOpen;
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectOption),
                        Icon(isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ),
              if (isOpen)
                ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: collector
                      .map((e) => Container(
                          decoration: BoxDecoration(
                              color: selectOption == e
                                  ? Colors.green
                                  : Colors.grey.shade300),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  selectOption = e;
                                  isOpen = false;
                                  setState(() {});
                                },
                                child: Text(e)),
                          )))
                      .toList(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
