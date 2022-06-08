import 'dart:io';

import 'package:citoyen/admin_constants.dart';
import 'package:flutter/material.dart';
class RoundedButton  extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  const RoundedButton ({ Key? key, required this.btnText, required this.onBtnPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: ()=>onBtnPressed,
        minWidth: 400,
        height: 60,
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        ),
      
    );
  }
}

class ButtonCostum extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;
  final Color colortext;
  final Color contenucolor;
  ButtonCostum({required this.titleText,required this.onTap,required this.colortext,required this.contenucolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0
        ),
        height: Platform.isIOS ? 60 : 50,
        child: Center(
          child: new Text(titleText,
            style: new TextStyle(
                color:colortext,
                fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: contenucolor,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}