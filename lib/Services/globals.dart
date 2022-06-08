import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL ="http://192.168.1.14/api/";
const myBaseURL = 'https://abc4-102-159-30-122.eu.ngrok.io/user-backend/public/index.php/api';
var authToken = "";
var authUser = null;
var isAdmin = 1;
const Map<String,String> headers = {"Content-Type":"application/json" };
errorSnackBar(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.red,
    content: Text(text),  
    duration: const Duration(seconds: 1)
    )
  );
}
