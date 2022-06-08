import 'package:citoyen/espace%20admin/Dash/adminDsh.dart';
import 'package:citoyen/espace%20admin/Dash/sidebar.dart';
import 'package:flutter/material.dart';

import '../widgets/NavigationDrawer.dart';



class Dashbord extends StatelessWidget {
  const Dashbord({ Key? key }) : super(key: key);
bool isDesktop(BuildContext context)=> MediaQuery.of(context).size.width <600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child:Sidebar(),
            ),
            Expanded(
            child: AdminDsh(),
            flex: 5,
            ),
         
          ],
        )
      ),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.lightGreen[900],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

