import 'package:citoyen/constants.dart';
import 'package:citoyen/espace_citoyen/drawer_menu_widget.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {

final VoidCallback openDrawer;


  const HomePage({ Key? key, 
  required this.openDrawer ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: DrawerMenuWidget(onClicked: openDrawer,),
      title: Text('Home Page'),
    ),
  );
  }
