// import 'dart:convert';
// import 'dart:io';

// import 'package:citoyen/Services/auth_services.dart';
// import 'package:citoyen/Services/globals.dart';
// import 'package:citoyen/admin_constants.dart';
// import 'package:citoyen/components/components.dart';
// import 'package:citoyen/espace%20admin/screens/admin_login.dart';
// import 'package:flutter/services.dart';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import '../../components/page_title_bar.dart';
// import '../../components/upside.dart';


// class AdminSignUpScreen extends StatefulWidget {
 
//   @override
//   const AdminSignUpScreen({Key? key}) : super(key: key);
//   _AdminSignUpScreenState createState() => _AdminSignUpScreenState();
// }


// class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
//   TextEditingController _email = new TextEditingController();
//   TextEditingController _password = new TextEditingController();
//   TextEditingController _name = new TextEditingController();
//   bool isLoader = true;
//   createAccountPressed() async{
//     bool emailValid= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@admin+\.[a-zA-Z]+").hasMatch(_email.text.trim());
//       if(emailValid){
//         if(_name.text.trim().isEmpty){
//           errorSnackBar(context, 'The name can not be empty');
//         }else if(_password.text.trim().isEmpty){
//           errorSnackBar(context, 'The password can not be empty');
//         }else if(_password.text.trim().length < 8){
//           errorSnackBar(context, 'Le mot de passe doit être supérieur ou égal à 8 caractères');
//         }else{
//           setState(() {
//             isLoader = false;
//           });
//           final data = {
//             'name': _name.text.trim(),
//             'email': _email.text.trim(),
//             'password': _password.text.trim()
//           };
//           AuthServices.userRegister(data).then((value) {
//             if(value){
//               setState(() {
//                 isLoader = true;
//               });
//               Navigator.push(context, 
//               MaterialPageRoute(
//                 builder: (BuildContext context) => AdminSignUpScreen()));
//             }else{
//               setState(() {
//                 isLoader = true;
//               });
//               errorSnackBar(context, 'Erreur lors de la création du compte. Veuillez-réessayer plus tard');
//             }
//           });
          
//         }
//       }else{
//         errorSnackBar(context, 'Enter a valid email');
//       }
//     }
  
//   // late Future<Data> futureData;

//   final formKey = GlobalKey<FormState>();
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();



//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: !isLoader?
//           Center(child: CircularProgressIndicator(),) :
//           SingleChildScrollView(
//             child: Stack(
//               children: [
//                 const Upside(
//                   imgUrl: "assets/images/register.png",
//                 ),
//                 const PageTitleBar(title: 'Create New Account'),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 320.0),
//                   child: Container(
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 child: Column(
//                                   children: [
//                                     Form(
//                                       key: formKey,
//                                       autovalidateMode:
//                                           AutovalidateMode.onUserInteraction,
//                                       child: Column(children: [
//                                         TextFormField(
//                                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                                           autofocus: false,
//                                           keyboardType: TextInputType.name,
//                                           // validator: (value) {
//                                           //   if (value != null && value.length <30) {
//                                           //     return 'Enter min. 30 characters ';
//                                           //   } else {
//                                           //     return null;
//                                           //   }
//                                           // },
//                                           textInputAction: TextInputAction.next,
//                                           controller: _name,
//                                           decoration: InputDecoration(
//                                               hoverColor: Colors.lightGreen[200],
//                                               prefixIcon: Icon(
//                                                 Icons.person,
//                                                 color: Color.fromARGB(255, 17, 131, 76),
//                                               ),
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(30.0),
//                                                 borderSide: BorderSide(width: 0, style: BorderStyle.none),
//                                               ),
//                                               enabledBorder: UnderlineInputBorder(
//                                                 borderSide: new BorderSide(color: Colors.white),
//                                                 borderRadius: new BorderRadius.circular(20),
//                                               ),
//                                               filled: true,
//                                               hintStyle: TextStyle(
//                                                 color: Color.fromARGB(255, 104, 104, 104),
//                                               ),
//                                               hintText: "Enter your name",
//                                               enabled: true,
//                                               fillColor: kPrimaryLightColor
//                                               ),

//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         TextFormField(
//                                           autofocus: false,
//                                           cursorColor: Color.fromARGB(255, 17, 131, 76),
//                                           keyboardType: TextInputType.emailAddress,
//                                           // validator: (email) => email != null && !EmailValidator.validate(email)
//                                           //     ? 'Enter a valid email'
//                                           //     : null,
//                                           textInputAction: TextInputAction.next,
//                                           decoration: InputDecoration(
//                                               hoverColor: Colors.lightGreen[200],
//                                               prefixIcon: Icon(
//                                                 Icons.email,
//                                                 color: Color.fromARGB(255, 17, 131, 76),
//                                               ),
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(30.0),
//                                                 borderSide: BorderSide(width: 0, style: BorderStyle.none),
//                                               ),
//                                               filled: true,
//                                               hintStyle: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
//                                               hintText: "Enter your email",
//                                               enabled: true,
//                                               fillColor: kPrimaryLightColor
//                                               ),
//                                               controller: _email,
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         TextFormField(
//                                           cursorColor: Color.fromARGB(255, 17, 131, 76),
//                                           autofocus: false,
//                                           obscureText: true,
//                                           // validator: (value) {
//                                           //   if (value != null && value.length < 30) {
//                                           //     return 'Enter min. 30 characters ';
//                                           //   } else {
//                                           //     return null;
//                                           //   }
//                                           // },
//                                           textInputAction: TextInputAction.next,
//                                           decoration: InputDecoration(
//                                               hoverColor: Colors.lightGreen[200],
//                                               prefixIcon: Icon(
//                                                 Icons.lock,
//                                                 color: Color.fromARGB(255, 17, 131, 76),
//                                               ),
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(30.0),
//                                                 borderSide: BorderSide(width: 0, style: BorderStyle.none),
//                                               ),
//                                               filled: true,
//                                               hintStyle: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
//                                               hintText: "Enter your password",
//                                               enabled: true,
//                                               fillColor: kPrimaryLightColor),
//                                               controller: _password,
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         //signUpButton,
//                                         /*RoundedButton(
//                                           btnText:'Signup',
//                                           onBtnPressed:(){
//                                             createAccountPressed();
//                                           },
//                                         ),*/
//                                         GestureDetector(
//                                         onTap: (){
//                                           createAccountPressed();
//                                         },
//                                         child: Container(
//                                           margin: const EdgeInsets.all(8),
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8.0
//                                           ),
//                                           height: Platform.isIOS ? 60 : 50,
//                                           child: Center(
//                                             child: new Text('Signup',
//                                               style: new TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20.0,fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: kPrimaryColor,
//                                             borderRadius: BorderRadius.circular(25),
//                                           ),
//                                         ),
//                                       ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         UnderPart(
//                                             title: "Already Have  an account?",
//                                             navigatorText: "Login",
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           AdminLoginScreen()));
//                                             }),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                       ]),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

 
// }
