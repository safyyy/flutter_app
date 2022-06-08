import 'package:citoyen/admin_constants.dart';
import 'package:flutter/material.dart';
class Btn extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  const Btn({ Key? key, required this.btnText, required this.onBtnPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed:(){
          onBtnPressed();
        },
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