import 'package:citoyen/Services/admin_services.dart';
import 'package:citoyen/admin_constants.dart';
import 'package:citoyen/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message extends StatefulWidget {
  final User citizen;
  const Message({Key? key, required this.citizen}) : super(key: key);
  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width < 600;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Message'),
        backgroundColor: Colors.lightGreen[900],
      ),
      backgroundColor: Colors.lightGreen[300],
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: messageController,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Enter message',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                    filled: true,
                    fillColor: kPrimaryLightColor),
              ),
              SizedBox(height: 25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                label: Text('Send'),
                icon: Icon(Icons.message_outlined),
                onPressed: () async {
                  var check = await AdminServices().sendMessage(widget.citizen.id, messageController.text);
                  if (check) {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: "Message has been sent successfully ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
