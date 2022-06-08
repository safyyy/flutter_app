import 'package:flutter/material.dart';
class Sidebar extends StatefulWidget {
  const Sidebar({ Key? key }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}
bool isDesktop(BuildContext context)=> MediaQuery.of(context).size.width <100;
class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
     elevation: 0,
    
      child: Container(
        color: Colors.lightGreen[300],

        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          //if(isDesktop(context))
          Container(

            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Text('WELCOME ', style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Spacer(),
          Image.asset("assets/images/logo.png"),

        ],
        ),
      ),
    );
  }
}