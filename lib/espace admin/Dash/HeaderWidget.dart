
import 'package:flutter/material.dart';
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({ Key? key }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text("Dashbord",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
          Spacer(),
          
        ],
      ),
      
    );
    
  }
  Widget navigationIcon({icon}){
    return Padding( 
      padding: EdgeInsets.all(8.0),
      child:Icon(
      icon, 
      color: Colors.black,
      ),
    );
    
  }
 
}