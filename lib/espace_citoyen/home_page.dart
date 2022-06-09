import 'dart:convert';

import 'package:citoyen/espace_citoyen/drawer_menu_widget.dart';
import 'package:citoyen/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../Services/globals.dart';

class HomePage extends StatefulWidget {
  final VoidCallback openDrawer;

  const HomePage({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Message>> getMessages() async {
    var user = GetStorage().read("user");

    try {
      final response = await http.get(Uri.parse("$myBaseURL/messages/${user['id']}"), headers: {
        'Authorization': 'Bearer ${user['token']}',
      });
      var result = jsonDecode(response.body);

      List<Message> messages = [];
      for (var item in result) {
        messages.add(Message.fromJson(item));
      }

      return messages;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: DrawerMenuWidget(
            onClicked: widget.openDrawer,
          ),
          title: Text('Home Page'),
        ),
        body: FutureBuilder(
            future: getMessages(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length != 0) {
                  List<Message> messages = [];

                  for (var item in snapshot.data) {
                    messages.add(item);
                  }
                  return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ExpansionTile(
                                  title: Row(
                                    children: [
                                      Text("Recu le ${DateFormat("yyyy-MM-dd hh:mm").format(messages[index].date)}"),
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          alignment: Alignment.centerLeft, child: Text("Content : ${messages[index].body}")),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      });
                } else {
                  return Center(
                      child: Text(
                    "No message available yet ",
                    style: TextStyle(color: Colors.white),
                  ));
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            }),
      );
}
