import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class Mailinput extends StatelessWidget {
  final String hintText;
  
  final IconData icon;
  const Mailinput({
    Key? key, 
    required this.hintText,
    
    this.icon=Icons.email,
     required AutovalidateMode autovalidateMode,
    
     
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      
      child:  TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
 
      decoration: InputDecoration(
        icon: Icon(icon,
        color: kPrimaryColor,),
        hintText: hintText,
       
        border: InputBorder.none,
      ),
      
     validator: (email)=>
     email !=null && !EmailValidator.validate(email)
     ? 'Enter a valid email'
     : null,
    
      
      ),
    );
  }
}