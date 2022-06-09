import 'package:citoyen/Services/admin_services.dart';
import 'package:citoyen/espace%20admin/screens/message.dart';
import 'package:citoyen/models/userModel.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

bool _userEdited = false;

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
      ),
      body: FutureBuilder(
          future: AdminServices().getCitizens(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length != 0) {
                List<User> citizens = [];

                for (var item in snapshot.data) {
                  citizens.add(item);
                }

                return ListView.builder(
                  itemCount: citizens.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.lightGreen[300],
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Message(citizen: citizens[index])),
                        );
                      },
                      // title: Text(Data[index]['title'],
                      title: Text(
                        "Hello ${citizens[index].name}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: ${citizens[index].email}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Gender: ${citizens[index].gender}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(children: []),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Text(
                  "No Citizens",
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
}
