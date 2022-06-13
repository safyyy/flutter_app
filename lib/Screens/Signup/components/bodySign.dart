import 'dart:io';

import 'package:citoyen/Screens/Login/login_screen.dart';
import 'package:citoyen/Screens/Signup/components/background.dart';
import 'package:citoyen/auth/auth_fingerprint.dart';
import 'package:citoyen/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Services/auth_services.dart';
import '../../../Services/globals.dart';
import '../../../components/text_field_container.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final Widget child;
  File? image;
  final formKey = GlobalKey<FormState>();

  TextEditingController _name = new TextEditingController();
  TextEditingController _cin = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool isLoader = true;
  String? gender = "";
  createAccountPressed() async {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@user+\.[a-zA-Z]+").hasMatch(_email.text.trim());
    if (emailValid) {
      if (_name.text.trim().isEmpty) {
        errorSnackBar(context, 'The name can not be empty');
      } else if (_password.text.trim().isEmpty) {
        errorSnackBar(context, 'The password can not be empty');
      } else if (_cin.text.trim().isEmpty) {
        errorSnackBar(context, 'The cin can not be empty');
      } else if (_age.text.trim().isEmpty) {
        errorSnackBar(context, 'The age can not be empty');
      } else if (_password.text.trim().length < 8) {
        errorSnackBar(context, 'Le mot de passe doit être supérieur ou égal à 8 caractères');
      } else if (gender!.isEmpty) {
        errorSnackBar(context, 'Genre obligatoire');
      } else {
        setState(() {
          isLoader = false;
        });

        final data = {
          'name': _name.text.trim(),
          'cin': _cin.text.trim(),
          'age': _age.text.trim(),
          'email': _email.text.trim(),
          'password': _password.text.trim(),
          "gender": gender
        };
        AuthServices.userRegister(data, 2).then((value) {
          if (value) {
            setState(() {
              isLoader = true;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AuthFinger(),
              ),
            );
          } else {
            setState(() {
              isLoader = true;
            });
            errorSnackBar(context, 'Erreur lors de la création du compte. Veuillez-réessayer plus tard');
          }
        });
      }
    } else {
      errorSnackBar(context, 'Enter a valid email');
    }
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      // encode image to base64

    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: image == null
                      ? Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            CupertinoIcons.camera,
                            color: Colors.grey,
                          ),
                        )
                      : Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          width: 100,
                          height: 100,
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                //name field
                TextFieldContainer(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Your Name",
                      border: InputBorder.none,
                    ),
                    controller: _name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Name ';
                      }
                      return null;
                    },
                  ),
                ),

                //cin field
                TextFieldContainer(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.card_membership_rounded,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Your Cin",
                      border: InputBorder.none,
                    ),
                    controller: _cin,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Please Enter Your CIN Number ';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Female",
                                  style: TextStyle(color: kPrimaryColor, fontFamily: "NunitoBold"),
                                ),
                                Icon(
                                  Icons.female,
                                  color: Colors.redAccent,
                                )
                              ],
                            ),
                            Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value as String?;
                                });
                              },
                              activeColor: Color(0xff056CF2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Male",
                                  style: TextStyle(color: kPrimaryColor, fontFamily: "NunitoBold"),
                                ),
                                Icon(
                                  Icons.male,
                                  color: Colors.blueAccent,
                                )
                              ],
                            ),
                            Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value as String?;
                                });
                              },
                              activeColor: Color(0xff056CF2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //mail field
                TextFieldContainer(
                  child: TextFormField(
                    controller: _email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Your Email",
                      border: InputBorder.none,
                    ),
                    validator: (email) => email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                  ),
                ),
                //age field
                TextFieldContainer(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Your age",
                      border: InputBorder.none,
                    ),
                    controller: _age,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your age ';
                      }
                      return null;
                    },
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
                          createAccountPressed();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AuthFinger();
                              },
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Have An Account ?",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
