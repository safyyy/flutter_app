import 'dart:io';

import 'package:citoyen/admin_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class AdminProfile extends StatefulWidget {
  const AdminProfile({ Key? key }) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  late final Widget child ;
File ? image;
   TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  final formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
        title: const Text ('Profile'),
        backgroundColor: Colors.lightGreen[900], 
      ),
            backgroundColor: Colors.lightGreen[300],

        body: SizedBox(
          
         
          
            child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

              children:<Widget> [
               
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
                
                  
                   Container(
                      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      
                    width: double.infinity,
                    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Form(
                                      key: formKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(children: [
                                        TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          autofocus: false,
                                          keyboardType: TextInputType.name,
                                        
                                          textInputAction: TextInputAction.next,
                                          controller: _name,
                                          decoration: InputDecoration(
                                              hoverColor: Colors.lightGreen[200],
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Color.fromARGB(255, 17, 131, 76),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: new BorderSide(color: Colors.white),
                                                borderRadius: new BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(255, 104, 104, 104),
                                              ),
                                              enabled: true,
                                              fillColor: kPrimaryLightColor
                                              ),

                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          autofocus: false,
                                          cursorColor: Color.fromARGB(255, 17, 131, 76),
                                          keyboardType: TextInputType.emailAddress,
                                          
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              hoverColor: Colors.lightGreen[200],
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Color.fromARGB(255, 17, 131, 76),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                                              ),
                                              filled: true,
                                              hintStyle: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
                                              enabled: true,
                                              fillColor: kPrimaryLightColor
                                              ),
                                              controller: _email,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        
                                   SizedBox(
                                          height: 20,
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      );
    
  }
}