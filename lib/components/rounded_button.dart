import 'package:citoyen/Screens/Login/login_screen.dart';
import 'package:citoyen/Screens/Signup/signup_screen.dart';
import 'package:citoyen/constants.dart';
import 'package:citoyen/espace_citoyen/dashboard.dart';
import 'package:citoyen/main.dart';
import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color,textColor;
  const RoundedButton({
    Key? key, 
    required this.text, 
    required this.press, 
    this.color=kPrimaryColor, 
    this.textColor=Colors.white,
    
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: () {Navigator.push(context, 
          MaterialPageRoute(builder: (context){return LoginScreen();},),);},
          child: Text(
            text, 
            style: TextStyle(color: textColor),),
        ),
        
      ),
    );
  }
}
