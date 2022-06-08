import 'package:citoyen/espace_citoyen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
class AuthLog extends StatefulWidget {
  const AuthLog({ Key? key }) : super(key: key);

  @override
  State<AuthLog> createState() => _AuthLogState();
}

class _AuthLogState extends State<AuthLog> {
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Dash(),),);
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
    return Container(
      
    );
  }
}