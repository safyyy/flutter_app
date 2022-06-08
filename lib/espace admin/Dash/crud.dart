import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({ Key? key }) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}
bool _userEdited =false;

class _CrudState extends State<Crud> {
 
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
      ),
      body: ListView.builder(
        //itemCount: Data.length,
        itemBuilder:(context,index)=> Card(

      
          color:  Colors.lightGreen[300],
          margin: const EdgeInsets.all(15),
          child: ListTile(
          isThreeLine: true,
           // title: Text(Data[index]['title'],
           title: const Text('hello users',
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
            color: Colors.black),
             ),
             subtitle: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text('ADMIN',
                   style:TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 15,
                     color: Colors.black,

                   ), 
                 ),
               ],
             ),
             trailing: SizedBox(
               width: 100,
               child: Row(children: [
                
              
               ]),
             ),
           
          ),
          

        ),
         
      ), 
    );
    
   
      
  
  }
 
}