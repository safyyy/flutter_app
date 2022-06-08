import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:flutter/material.dart';
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    Key? key, 
    required this.hintText,
    this.icon=Icons.person, 
     required AutovalidateMode autovalidateMode, 
     
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      
      child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        
        icon: Icon(icon,
        color: kPrimaryColor,),
        hintText: hintText,
        border: InputBorder.none,
      ),
      validator: (value){
        if (value==null || value.isEmpty){
          return 'Please Enter Your Name ';

        }
        return null;

      },
     
      ),
      );
  }
}

