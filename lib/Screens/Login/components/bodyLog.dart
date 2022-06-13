import 'package:citoyen/Screens/Login/components/backgroundlog.dart';
import 'package:citoyen/auth/auth_login.dart';
import 'package:citoyen/components/already_have_an_account.dart';
import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Services/auth_services.dart';
import '../../../Services/globals.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    TextEditingController _email = new TextEditingController();
    TextEditingController _password = new TextEditingController();
    bool isLoader = true;

    loginPressed() async {
      bool emailValid =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text.trim());
      if (emailValid) {
        if (_password.text.trim().isEmpty) {
          errorSnackBar(context, 'The password can not be empty');
        } else if (_password.text.trim().length < 8) {
          errorSnackBar(context, 'Le mot de passe doit être supérieur ou égal à 8 caractères');
        } else {
          setState(() {
            isLoader = false;
          });
          final data = {'email': _email.text.trim(), 'password': _password.text.trim()};
          AuthServices.userLogin(data, 2).then((value) {
            if (value != 0 && value != 9) {
              setState(() {
                isLoader = true;
              });
              if (value == 1) {
                // TODO: ADD ADMIN REDIRECTION!

                print("Admin");
              } else if (value == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AuthLog()));
              }
            } else {
              setState(() {
                isLoader = true;
              });
              var msgError = "error";
              if (value == 9) {
                msgError = "Veuillez verifier votre compte";
              } else {
                msgError = "Veuillez verifier votre email ou mot de passe";
              }
              errorSnackBar(context, msgError);
            }
          });
        }
      } else {
        errorSnackBar(context, 'Enter a valid email');
      }
    }

    return Scaffold(
      body: BackgroundLogin(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                //mail field
                TextFieldContainer(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Your Email",
                      border: InputBorder.none,
                    ),
                    controller: _email,
                    validator: (email) => email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                  ),
                ),
                //password field
                TextFieldContainer(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                    controller: _password,
                    validator: (value) {
                      if (value != null && value.length < 7) {
                        return 'Enter min. 7 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          loginPressed();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AuthLog();
                              },
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccount(
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
