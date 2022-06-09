import 'dart:convert';

import 'package:citoyen/models/userModel.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';

class AdminServices {
  Future<List<User>> getCitizens() async {
    var user = GetStorage().read("user");
    print(user['token']);
    try {
      final response = await http.get(Uri.parse("$myBaseURL/citizens"), headers: {
        'Authorization': 'Bearer ${user['token']}',
      });
      var result = jsonDecode(response.body);

      List<User> citizens = [];
      for (var item in result) {
        citizens.add(User.fromJson(item));
      }

      return citizens;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<bool> sendMessage(int id, String message) async {
    var user = GetStorage().read("user");
    Map body = {"body": message, "id": id};
    print(user['token']);

    try {
      final response = await http.post(
        Uri.parse("$myBaseURL/message"),
        headers: {
          'Authorization': 'Bearer ${user['token']}',
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

/**********************************************
  - get citizens where status ==
  - display citizens infos
  - onTap on citizen navigate to message ui
  - send message to selected user
  ******************** TRY IT *****************
***********************************************/
