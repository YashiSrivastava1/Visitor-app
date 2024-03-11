import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visitors_app/Controllers/baseAPI.dart';
import 'package:visitors_app/screens/otpScreen.dart';
import 'package:visitors_app/screens/visitorScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _isButtonDisabled = false;
  bool _isFieldDisabled=false;
  bool _isOTPVisible = false;
  bool _isSubmitButtonVisible = false;
  var globalResponse;

  late TextEditingController controller;

  getOTP() async {
     var endpoint='login';
  var baseUrl= BaseApi().baseApi;
  var finalUrl=baseUrl+endpoint;
 // var url = Uri.parse(finalUrl);
    print('hello');
    try {
      final response = await http.post(
        
        Uri.parse(finalUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'mobNo': controller.text}),

       
      );
      final responseData = (response.body);
      print('respopnse $responseData');

      print('hellohjbvhjv');
      if (response.statusCode == 201) {
        
        final responseData = jsonDecode(response.body);
       Fluttertoast.showToast(msg: "OTP sent, valid till 12 minutes");
        print('heya');
      } else {
       
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  verifyOTP() async {
    print('hello');
    var endpoint='otpValidate';
  var baseUrl= BaseApi().baseApi;
  var finalUrl=baseUrl+endpoint;
  var url = Uri.parse(finalUrl);
    try {
      final response = await http.post(
        
        Uri.parse(finalUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'mobNo': controller.text,
          'otp': otpController.text
        }),

      
      );
      final responseData = (response.body);
      print('respopnse $responseData');

      print('hellohjbvhjv');
      if (response.statusCode == 200) {
        
        final responseData = jsonDecode(response.body);
        print("response over here ${responseData["status_code"]}");

        if (responseData['status_code'] == 200) {
          Fluttertoast.showToast(msg: "OTP Verified");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VisitorForm(),
            ),
          );
        }

        print('heya');
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      _isButtonDisabled = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/cyflogo.jpeg',
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 60,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/blueBackgroundScreen.jpg'),
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child: TextField(
    controller: controller,
    maxLength: 10,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      enabled: !_isFieldDisabled,
      enabledBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: Colors.orange, width: 2.0),
      ),
      focusedBorder: new OutlineInputBorder(
        borderSide: new BorderSide(color: Colors.orange, width: 2.0),
      ),
      border: InputBorder.none,
      hintText: "0123456789",
      labelText: "Mobile Number",
      labelStyle: TextStyle(color: Colors.blue),
      counterText: "",
      hintStyle: TextStyle(color: Colors.blue),
      suffixIcon: Icon(
        Icons.phone,
        color: Colors.blue,
      ),
    ),
    style: TextStyle(color: Colors.black, letterSpacing: 0),
  ),
),

              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 340,
                child: ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    enabledMouseCursor: MouseCursor.uncontrolled,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onPressed: _isButtonDisabled
    ? null
    : () {
        print('Im here');
        getOTP();
        setState(() {
          _isFieldDisabled = true;
          _isButtonDisabled = true;
          _isOTPVisible = true;
          _isSubmitButtonVisible = true;
        });
      },

  icon: const Icon(
    Icons.ads_click,
    color: Colors.white,
  ),
  label: Text("Generate OTP", style: TextStyle(color: Colors.white)),
),

              ),
              SizedBox(
                height: 70,
              ),
              Visibility(
                visible: _isOTPVisible,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: otpController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.orange, width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.orange, width: 2.0),
                        ),
                        border: InputBorder.none,
                        hintText: "",
                        labelText: "Enter OTP",
                        labelStyle: TextStyle(color: Colors.blue),
                        counterText: "",
                        hintStyle: TextStyle(color: Colors.blue),
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                      ),
                      style: TextStyle(color: Colors.black, letterSpacing: 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _isSubmitButtonVisible,
                child: SizedBox(
                  width: 340,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      enabledMouseCursor: MouseCursor.uncontrolled,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      verifyOTP();
                      // _isButtonDisabled = false;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> VisitorForm(),));
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: Text("Submit OTP", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}