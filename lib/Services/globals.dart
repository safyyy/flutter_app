import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "http://192.168.1.14/api/";
const myBaseURL = 'http://192.168.1.166:8000/api';
var authToken = "";
var authUser = null;
var isAdmin = 1;
const Map<String, String> headers = {"Content-Type": "application/json"};
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(text), duration: const Duration(seconds: 1)));
}
