import 'package:citoyen/Screens/Login/login_screen.dart';
import 'package:citoyen/Screens/Signup/signup_screen.dart';
import 'package:citoyen/constants.dart';
import 'package:flutter/material.dart';
class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
   const AlreadyHaveAnAccount({
    Key? key, 
     this.login= true, 
     required this.press,  

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an Account ?" , 
         style: 
         TextStyle(
           color: kPrimaryColor
          ),
          ),
          GestureDetector(
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context){return SignUpScreen();},),);},
            child: Text(
              "Sign Up" , 
            style: 
            TextStyle(
              color: kPrimaryColor, 
              fontWeight: FontWeight.bold,
          
              ),
              ),
          ),
          ],
    );
  }
}

