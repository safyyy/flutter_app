import 'dart:convert';
import 'dart:io';

import 'package:citoyen/Services/globals.dart';
import 'package:citoyen/admin_constants.dart';
import 'package:citoyen/components/components.dart';
import 'package:citoyen/espace%20admin/Dash/adminDsh.dart';
import 'package:citoyen/espace%20admin/screens/Dashbord.dart';
import 'package:citoyen/espace%20admin/screens/admin_signup.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:citoyen/Services/auth_services.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../components/page_title_bar.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
   bool isLoader = true;

  loginPressed() async {
     bool emailValid= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@admin\.[a-zA-Z]+").hasMatch(_email.text.trim());
     if(emailValid){
       if(_password.text.trim().isEmpty){
          errorSnackBar(context, 'The password can not be empty');
        }else if(_password.text.trim().length < 8){
          errorSnackBar(context, 'Le mot de passe doit être supérieur ou égal à 8 caractères');
        }
        else{
          setState(() {
            isLoader = false;
          });
           final data = {
            'email': _email.text.trim(),
            'password': _password.text.trim()
          };
          AuthServices.userLogin(data).then((value) {
            if(value!=0&&value!=9){
              setState(() {
                isLoader = true;
              });
              if(value==1){
                // TODO: ADD ADMIN REDIRECTION!
                /* Navigator.push(context, 
              MaterialPageRoute(
                builder: (BuildContext context) => DashAdmin())); */
                print("Admin");
              }else if(value==2){
               
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (BuildContext context) => Dashbord()));
              }
            }else{
              setState(() {
                isLoader = true;
              });
              var msgError = "error";
              if(value==9){
                msgError = "Veuillez verifier votre compte";
              }else{
                msgError = "Veuillez verifier votre email ou mot de passe";
              }
              errorSnackBar(context, msgError);
            }
          });
     }
  }else{
        errorSnackBar(context, 'Enter a valid email');
      }

  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailField = TextFormField(
      //  validator: (email) {
      //    if((!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      //   .hasMatch(email!))){
      //     return 'Enter a valid email';
      //   }
      //   return null;
      //   },
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hoverColor: Colors.lightGreen[200],
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromARGB(255, 17, 131, 76),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(20),
          ),
          filled: true,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 104, 104, 104),
          ),
          hintText: "Enter your email",
          enabled: true,
          fillColor: kPrimaryLightColor),
          controller: _email,
     
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      // validator: (value) {
      //   if(value != null && value.length < 7){
      //     return'Enter min.  characters ';
      //   }else{
      //     return null;
      //   }
      // },

      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hoverColor: Colors.lightGreen[200],
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 17, 131, 76),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none,),
          ),
          filled: true,
          hintStyle: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
          hintText: "Enter your password",
          enabled: true,
          fillColor: kPrimaryLightColor
          ),
          controller: _password,
   

    );

  
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(imgUrl: "assets/images/login.png"),
                const PageTitleBar(title: "Login to your account"),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: formKey,
                            child: Column(
                              children: [
                                emailField,
                                const SizedBox(
                                  height: 20,
                                ),
                                passwordField,
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(),
                                const SizedBox(
                                  height: 10,
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                //loginButton,
                                // RoundedButton(
                                //   btnText: 'Login',
                                //   onBtnPressed: () => loginPressed(context),
                                // ),
                                GestureDetector(
                                        onTap: (){
                                       loginPressed();
                                        //  Navigator.push(
                                        // context,
                                        // MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         Dashbord()));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0
                                          ),
                                          height: Platform.isIOS ? 60 : 50,
                                          child: Center(
                                            child: new Text('Login',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // UnderPart(
                                //   title: "",
                                //   navigatorText: "Register here",
                                //   onTap: () {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 AdminSignUpScreen()));
                                //   },
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
