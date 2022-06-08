import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'crud.dart';
class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 206, 69),
        borderRadius: BorderRadius.circular(20.0),
      ),
      
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,      
            children: [
              Text.rich(TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
               children: [
                 TextSpan(text:"Good Morning"),
                 TextSpan(text:"Admin Space",style: TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
                 ),
               
               ]
              )
              ),
                SizedBox(
                   height: 13,
                 ),
                 Text('Today you have 9 applications,',
                 style:TextStyle(
                   fontSize: 14,
                   height: 1.5,
                 ) 
                 ,),   
            ],
          
          ),
         
          Spacer(),
        ],
        
      ),
    
  
 );

 
  }
  
  
}