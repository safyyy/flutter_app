import 'package:citoyen/constants.dart';
import 'package:citoyen/map/map.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';



class AuthFinger extends StatefulWidget {
  const AuthFinger({ Key? key }) : super(key: key);

  @override
  State<AuthFinger> createState() => _AuthFingerState();
}

class _AuthFingerState extends State<AuthFinger> {
  bool? _hasBioSensor;
  LocalAuthentication authentication=LocalAuthentication();
  Future<void> _checkBio()async{
    try{
      _hasBioSensor= await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if(_hasBioSensor!){
        _getAuth();
      }
      

    }on PlatformException catch(e){
      print(e);
    }
  }
  Future<void> _getAuth() async{
    bool isAuth=false;
    try{
      isAuth= await authentication.authenticate(
        localizedReason: 'Scan Your FingerPrint To access',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true
      );
      if (isAuth){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>const Geo()),);
      }
      print(isAuth);

    }on PlatformException catch(e){
      print(e);
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkBio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Authentificate Your FingerPrint',
            style: TextStyle(fontSize: 20),
            
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text('Check'),
                onPressed: (){
                  _checkBio();
                  },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: kPrimaryColor,
                ),
                ),
            ),
        ],
      ),
      
    );
  }
}