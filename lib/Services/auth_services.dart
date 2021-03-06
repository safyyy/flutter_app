import 'dart:convert';

import 'package:citoyen/Services/globals.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<bool> userRegister(Map<String, dynamic> data, int index) async {
    final response = await http.post(Uri.parse("$myBaseURL/auth/register"), body: data);
    print("response.body ${response.body}");
    if (response.statusCode == 200) {
      var mydata = json.decode(response.body);
      GetStorage().write("auth", 1);
      GetStorage().write("type_auth", index);
      GetStorage().write("user", {
        "name": mydata["user"]["name"],
        "email": mydata["user"]["email"],
        "cin": mydata["user"]["cin"],
        "gender": mydata["user"]["gender"],
        "age": mydata["user"]["age"],
        "token": mydata["token"],
        "id": mydata["user"]["id"],
      });

      return true;
    } else
      return false;
  }

  static Future<int> userLogin(Map<String, dynamic> data, int index) async {
    final response = await http.post(Uri.parse("$myBaseURL/auth/login"), body: data);
    if (response.statusCode == 200) {
      var mydata = json.decode(response.body);
      print(mydata);
      authToken = mydata['token'];
      authUser = mydata['user'];
      isAdmin = mydata['user']['admin'];
      GetStorage().write("auth", 1);
      GetStorage().write("type_auth", index);
      GetStorage().write("user", {
        "name": mydata["user"]["name"],
        "email": mydata["user"]["email"],
        "cin": mydata["user"]["cin"],
        "gender": mydata["user"]["gender"],
        "age": mydata["user"]["age"],
        "token": mydata["token"],
        "id": mydata["user"]["id"],
      });
      // activated = mydata['user']['status'];
      // if(activated==0){
      //print("Account not activated yet");
      //return 9;
    }
    print(authToken);
    if (isAdmin == 1) {
      return 1;
    } else {
      return 2;
    }
  }
}
