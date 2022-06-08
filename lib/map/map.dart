import 'package:citoyen/Screens/Signup/components/bodySign.dart';
import 'package:citoyen/map/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Geo extends StatefulWidget {
  const Geo({Key? key}) : super(key: key);

  @override
  State<Geo> createState() => _GeoState();
}

class _GeoState extends State<Geo> {
  @override
  Widget build(BuildContext context) {
    return 
      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      
  
    );
    
    

    
  }
}
