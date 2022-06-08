import 'package:citoyen/constants.dart';
import 'package:citoyen/espace_citoyen/drawer_item.dart';
import 'package:citoyen/espace_citoyen/drawer_items.dart';
import 'package:citoyen/espace_citoyen/drawer_widget.dart';
import 'package:citoyen/espace_citoyen/home_page.dart';
import 'package:citoyen/espace_citoyen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Dash extends StatefulWidget {
  const Dash({ Key? key }) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  late double xOffset ;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item=DrawerItems.home;
  bool isDragging=false;
  @override
  void initState(){
    super.initState();
    closeDrawer();
  }

  void closeDrawer()=>setState(() {
    xOffset=0;
    yOffset=0;
    scaleFactor=1;
    isDrawerOpen=false;
  });

  

  void openDrawer()=>setState(() {
    xOffset=230;
    yOffset=150;
    scaleFactor=0.6;
    isDrawerOpen=true;
  });



  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
  body:Stack(children:[
    buildDrawer(),
    buildPage(),
    ],
    ), 
  );

  Widget buildDrawer()=>SafeArea(
    child:Container (
      width:xOffset,
      child:DrawerWidget(
        
      onSelectedItem: (item){

        switch(item){
          case DrawerItems.logout:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
content:Text('Logging out')
          ));
          return;
          default:
        
        setState(() =>this.item=item);
        closeDrawer();
        }
      },
    ) ,
    ),
    );

    Widget buildPage(){
     
      return WillPopScope(
        onWillPop:() async{
          if (isDrawerOpen){
            closeDrawer();
            return false;
          }else{
            return true;
          }

        },
     child: GestureDetector(
        onTap:closeDrawer,
        onHorizontalDragStart: (details)=>isDragging=true,
        onHorizontalDragUpdate: (details){
          if(!isDragging)return;
          const delta=1;
          if (details.delta.dx > delta){
            openDrawer();
          }else if (details.delta.dx < -delta){
            closeDrawer();
          }
          isDragging=false;
        },
      child:AnimatedContainer(
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
        child:AbsorbPointer(
          absorbing: isDrawerOpen,
        child:ClipRRect(borderRadius:BorderRadius.circular(isDrawerOpen?20:0),
        
         child:Container(
          color: isDrawerOpen ? Colors.white12: Theme.of(context).primaryColor,
          child: getDrawerPage(),
        ),
        ),
      ),
      ),
      ),
      );
    }
    Widget getDrawerPage(){
    switch(item){
      case DrawerItems.profile:
      return ProfilePage(openDrawer:openDrawer);
      case DrawerItems.home:
      default:
      return HomePage(openDrawer: openDrawer);
    }
  }

  }

  

 

