import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:visitors_app/screens/otpScreen.dart';
import 'package:visitors_app/screens/visitorScreen.dart';
import 'package:lottie/lottie.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> 
  {
    TextEditingController otpController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  //TextEditingController otpButton=TextEditingController();
  late TextEditingController controller;
  @override
  void initState()
  {
    super.initState();
    controller=TextEditingController();
    controller.addListener(() { 
      final isButtonActive=controller.text.isNotEmpty;
      
    });
  }
  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar:
     AppBar(title: Text("Login/Signup", style: TextStyle(color: Colors.white
    )
     ),
     backgroundColor: Color.fromARGB(255, 32, 117, 186),
    centerTitle: true,),
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          
          image: AssetImage('assets/blueHexagon.json'),
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
         
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
          hintText: "Enter your Mobile Number",
          suffixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black)),
          ),
          
              ),
              ),
        
        // SizedBox(height: 30),
        // ElevatedButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder:(_)=> OTPScreen(),
        //    : OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black))));
         
      
          
        // }, child: Text("Verify Phone Number", style: TextStyle( color: Colors.blue)))
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 340,
          child: ElevatedButton.icon(
           
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 117, 186),
              enabledMouseCursor: MouseCursor.uncontrolled,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              
            ),
          ), 
          onPressed: () {},
          icon: const Icon(Icons.check, color: Colors.white,),
          label:  Text("Generate OTP", style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(
          height: 70,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
          hintText: "Enter OTP",
          suffixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black)),
          ),
              ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
          width: 340,
          child: ElevatedButton.icon(
           
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 117, 186),
              enabledMouseCursor: MouseCursor.uncontrolled,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              
            ),
          ), 
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(_)=> VisitorForm(),));
          },
          icon: const Icon(Icons.check, color: Colors.white,),
          label:  Text("Submit OTP", style: TextStyle(color: Colors.white)),
          
          ),
        ),
        // Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 25),
        //     child: TextField(
            
        //      controller: otpController,
        //      keyboardType: TextInputType.phone,
        //      decoration: InputDecoration(
        //       hintText: "Enter OTP",
              
        //       suffixIcon: Icon(Icons.phone),
        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(25) )
            
        //      ),
        //     ),
        //   ),
        //   SizedBox(height: 30),
         
        // ElevatedButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder:(_)=> VisitorForm(),));
          
        // }, child: Text("Submit OTP", style: TextStyle( color: Colors.blue)))
        ],),
    )
    );
  }
}