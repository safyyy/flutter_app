import 'package:citoyen/Screens/Login/login_screen.dart';
import 'package:citoyen/Screens/Signup/signup_screen.dart';
import 'package:citoyen/Screens/Welcome/components/background.dart';
import 'package:citoyen/components/rounded_button.dart';
import 'package:citoyen/constants.dart';
import 'package:citoyen/espace%20admin/screens/admin_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/signup_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold),
             ),
            SizedBox(height: size.height*0.03),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
             ),
            SizedBox(height: size.height*0.05),
             RoundedButton(
              text: "USER",
              press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);},
             ),
             SignupButton(
              text: "ADMIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press:(){Navigator.push(context, MaterialPageRoute(builder: (context){return AdminLoginScreen();},),);},
              ),
          ],
        ),
      ),
    );
  }
}

