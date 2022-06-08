import 'dart:io';

import 'package:citoyen/components/text_field_container.dart';
import 'package:citoyen/constants.dart';
import 'package:citoyen/espace_citoyen/drawer_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback openDrawer;
  const ProfilePage({ Key? key,required this.openDrawer }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   late final Widget child ;
File ? image;
final formKey=GlobalKey<FormState>();
  TextEditingController _name=new TextEditingController();
 TextEditingController _cin=new TextEditingController();
   TextEditingController _age=new TextEditingController();
 TextEditingController _email=new TextEditingController();
   bool isLoader = true;


   

 



Future getImage()async{
  
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    
    if (image==null)return;
    final imageTemp = File(image.path);
    setState(()=>this.image=imageTemp);
  }on PlatformException catch(e){
    print('Failed to pick image:$e');
  }
}




  @override
  Widget build(BuildContext context){ return Scaffold(
    
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: DrawerMenuWidget(onClicked: widget.openDrawer,),
      title: Text('Profile Page'),
      
    ),
 

       body:  
       
       Center(
         child: Form(
           
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                
               InkWell( onTap: (){
                 getImage();
               }, 
                 child: image== null? Container(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
          
                  ),
                  ),
                  width: 100,
                  height: 100,
                  child: Icon(CupertinoIcons.camera,color: Colors.grey,),
                  
                  ):Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
          
                  ),
                  ),
                  width: 100,
                  height: 100,
                  child: Image.file(
                     image!, 
                  fit: BoxFit.cover,),
                  
                  ),
                
                  ),
              //name field  
               TextFieldContainer(
          
          child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
            
            icon: Icon(Icons.person,
            color: kPrimaryColor,),
           
            border: InputBorder.none,
          ),
           controller: _name,

         
         
          ),
          ),
              
                //cin field
                TextFieldContainer(
          
          child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
            
            icon: Icon(Icons.card_membership_rounded,
            color: kPrimaryColor,
            ),
            border: InputBorder.none,
          ),
controller: _cin,
         
  
          ),
          ),
          //mail field
             TextFieldContainer(
          
          child:  TextFormField(
            controller: _email,
          autovalidateMode: AutovalidateMode.onUserInteraction,
 
          decoration: InputDecoration(
            icon: Icon(Icons.email,
            color: kPrimaryColor,),
           
            border: InputBorder.none,
          ),

      
      
          
          ),
      ),
      //age field
           TextFieldContainer(
          
          child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
            
            icon: Icon(Icons.numbers,
            color: kPrimaryColor,),
            border: InputBorder.none,
          ),
           controller: _age,

         
         
          ),
          ),
              ]
            ),
          ),
       ),
       
      );
  
    
  
}
}