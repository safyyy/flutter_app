import 'package:citoyen/espace_citoyen/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class DrawerItems{
  static const home =DrawerItem(title: 'Home', icon:FontAwesomeIcons.home);
  static const profile =DrawerItem(title: 'Profile', icon:FontAwesomeIcons.userAlt);
  static const logout =DrawerItem(title: 'Logout', icon:Icons.logout);
  static final List<DrawerItem> all =[
home,
profile,
logout,
  ];
}