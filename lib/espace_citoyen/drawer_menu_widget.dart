import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuWidget({ Key? key, required this.onClicked }) : super(key: key);

  @override
  Widget build(BuildContext context) =>IconButton(
    icon: Icon(Icons.menu),
    color: Colors.white,
    onPressed: onClicked, 
    );
  }
