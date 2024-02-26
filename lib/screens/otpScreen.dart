import 'package:flutter/material.dart';
import 'package:visitors_app/screens/visitorScreen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("OTP Screen", style: TextStyle(color: Colors.blue),),
      centerTitle: true,
      ),
      body: Column(children: [

        
      ]),
    );
  }
}