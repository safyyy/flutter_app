import 'dart:async';

import 'package:citoyen/Screens/Welcome/welcome_screen.dart';
import 'package:citoyen/constants.dart';
import 'package:citoyen/espace_citoyen/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import 'espace admin/screens/Dashbord.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var resultSeen = GetStorage().read("seen");
  var auth = GetStorage().read("auth");

  var type_auth = GetStorage().read("type_auth");
  @override
  void initState() {
    super.initState();
    var timer = Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => (auth == 1 ? (type_auth == 1 ? Dashbord() : Dash()) : WelcomeScreen()),
            )));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: const BoxDecoration(),
            child: Column(children: <Widget>[
              SizedBox(
                height: size.height * 0.2,
              ),
              Lottie.asset("assets/images/hello.json", height: Constants.screenHeight * 0.3),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Bienvenue chez notre municipalité",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Lottie.asset("assets/images/loading.json", height: Constants.screenHeight * 0.2),
            ])));
  }
}
