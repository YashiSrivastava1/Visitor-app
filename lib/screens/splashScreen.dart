import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visitors_app/screens/employeeLogin.dart';
import 'package:visitors_app/screens/loginPage.dart';
import 'package:visitors_app/screens/otpScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin{
  @override
  void initState()
  {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> EmployeeLogin(),));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values
    );
    // TODO: implement dispose
    super.dispose();
  }
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
           colors: [Colors.blue, Colors.white],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
        Image(image: AssetImage('assets/CyFutureLogo.png'),),
        SizedBox(height: 20),
        Text(
          'Welcome to CyFuture',
          style: TextStyle(fontStyle: FontStyle.normal,
          color: Colors.white,
          fontSize: 30,
          ),
        ),
      ],),
      ),
    );
  }
}

class SystemUIMode {
}