import 'package:citoyen/admin_constants.dart';
import 'package:citoyen/map/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/Login/login_screen.dart';
import '../components/rounded_button.dart';



class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                      Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF6F35A5),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Color(0xFFF1E6FF),
              size: 40,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'User Location',
              style: TextStyle(
                  color: Color(0xFFF1E6FF),
                  fontSize: 30,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                controller.latitude.value,
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 113, 227),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Obx(
              () => Text(
                controller.longitude.value,
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 113, 227),
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Obx(
              () => Text(
                controller.address.value,
                style: TextStyle(color: Color.fromARGB(255, 223, 113, 227), fontSize: 25),
              ),
            ),

            Container(

      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Color(0xFFF1E6FF),
          onPressed: () {Navigator.push(context, 
          MaterialPageRoute(builder: (context){return LoginScreen();},),);},
          child: Text(
            "LOGIN", 
            style: TextStyle(color: Color(0xFF6F35A5)),),
        ),
        
      ),
    ),
          ],
          
        ),
       
      ),
      ),
    );
  }
}
