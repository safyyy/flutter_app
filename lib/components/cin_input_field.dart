import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:flutter/material.dart';

class Cininput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  const Cininput({ 
    Key? key,
    required this.hintText,
  required AutovalidateMode autovalidateMode, 
    this.icon=Icons.card_membership_rounded,  

    
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      
      child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        
        icon: Icon(icon,
        color: kPrimaryColor,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
      validator: (value){
        if (value==null || value.isEmpty || value.length<8){
          return 'Please Enter Your CIN Number ';

        }
        return null;

      },
      
     
      ),
      );
  }
}