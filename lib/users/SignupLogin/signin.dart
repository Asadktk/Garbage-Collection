import 'package:flutter/material.dart';
import 'package:garbage_collection/users/SignupLogin/signup.dart';
import 'package:garbage_collection/widgets/button_widgets.dart';
import 'package:garbage_collection/widgets/text.dart';
import 'package:garbage_collection/widgets/textfield.dart';

import '../../../api/SignupLogin/login.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  LoginApi api = new LoginApi();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/first.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: height * 0.8,
          width: width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/garbage.png',
                ),
              ),
              textWidget(
                  title: "Sign In",
                  color: Colors.black,
                  fsize: 26.0,
                  fweight: FontWeight.bold),
              textField(
                textController: emailEditingController,
                width: width,
                text: "Enter Email ",
                icon: Icon(Icons.people_alt),
              ),
              textField(
                textController: passwordEditingController,
                width: width,
                text: "Password",
                icon: Icon(Icons.remove_red_eye),
              ),
              InkWell(
                onTap: () {
                  api.loginApis(
                      email: emailEditingController.text,
                      password: passwordEditingController.text,
                      context: context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const AdminDashBoard()),
                  // );
                },
                child: button(
                    title: "Sign In",
                    width: width * 0.8,
                    fsize: 24.0,
                    height: height * 0.05,
                    bgColor: Colors.green,
                    txtColor: Colors.white),
              ),
              textWidget(
                  title: "Forgoten Password",
                  color: Colors.green,
                  fsize: 16.0,
                  fweight: FontWeight.w500),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  child: textWidget(
                      title: "_________________",
                      color: Colors.black,
                      fsize: 16.0,
                      fweight: FontWeight.w500),
                ),
                textWidget(
                    title: "or",
                    color: Colors.black,
                    fsize: 16.0,
                    fweight: FontWeight.w500),
                Container(
                  child: textWidget(
                      title: "________________",
                      color: Colors.black,
                      fsize: 16.0,
                      fweight: FontWeight.w500),
                ),
              ]),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: button(
                  title: "Sign Up",
                  width: width * 0.8,
                  fsize: 24.0,
                  height: height * 0.05,
                  bgColor: Colors.green,
                  txtColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
