import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:flutter/material.dart';
class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key, 
    required AutovalidateMode autovalidateMode,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      
      child: TextFormField(
        
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      decoration: InputDecoration(
        
      hintText: "Password",
      icon: 
    Icon(
      Icons.lock,
      color: kPrimaryColor,
      ),
      suffixIcon: Icon(
        Icons.visibility,
        color: kPrimaryColor,
        ),
        border: InputBorder.none,
    ),
    validator: (value){
      if (value!=null && value.length<7){
        return 'Enter min. 7 characters';
      }else{
        return null;
      }
    },
    
    ),
    );
  }
}

