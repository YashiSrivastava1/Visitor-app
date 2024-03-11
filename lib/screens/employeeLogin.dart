import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:visitors_app/screens/dashboardScreen.dart';
import 'package:visitors_app/screens/loginPage.dart';
import 'package:visitors_app/screens/visitorScreen.dart';

class EmployeeLogin extends StatefulWidget {
  const EmployeeLogin({super.key});

  @override
  State<EmployeeLogin> createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String employee = "employee@cyfuture.com";
  String guard = "guard@cyfuture.com";
  bool pass = true;
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

// SizedBox(

// width: 60,

// )
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(10), )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: emailController,
                //maxLength: 10,
                keyboardType: TextInputType.emailAddress,

                decoration: new InputDecoration(
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.orange, width: 2.0),
                  ),

                  hintText: "abc@cyfuture.com",
                  labelText: "Email ID",
                  labelStyle: TextStyle(color: Colors.blue),
                  counterText: "",
                  hintStyle: TextStyle(color: Colors.blue),
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(color: Colors.black, letterSpacing: 0),
              ),
            ),
            // Padding(

            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: TextField(controller: controller,
            //   maxLength: 10,

            //       keyboardType: TextInputType.number,
            //       decoration: const InputDecoration(
            //           hintText: "0123456789",
            //           //hintStyle: Colors.white,

            //   border: OutlineInputBorder(
            //   //borderSide: BorderSide(color: Colors.white)
            //   borderSide: BorderSide(color: Colors.white)
            //   ),

            //         counterText: "",

            //         //hintStyle: TextStyle(color: Colors.white),
            //   labelText: "Enter your Mobile Number",
            //   labelStyle: TextStyle(color: Colors.white),
            //   suffixIcon:
            //    Icon(Icons.phone, color: Colors.white,),
            //       ),

            //   style: TextStyle(color: Colors.white, letterSpacing: 0),

            //       ),
            //       ),

            // SizedBox(height: 30),
            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder:(_)=> OTPScreen(),
            //    : OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black))));

            // }, child: Text("Verify Phone Number", style: TextStyle( color: Colors.blue)))
            // SizedBox(
            //   height: 30,
            // ),
            // SizedBox(
            //   width: 340,
            //   child: ElevatedButton.icon(

            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color.fromARGB(255, 32, 117, 186),
            //       enabledMouseCursor: MouseCursor.uncontrolled,
            //       //crossAxisAlignment: CrossAxisAlignment.stretch,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(5.0),

            //     ),
            //   ),
            //   onPressed: () {},
            //   icon: const Icon(Icons.ads_click, color: Colors.white,),
            //   label:  Text("Input Email", style: TextStyle(color: Colors.white)),
            //   ),
            // ),
            SizedBox(
              height: 70,
            ),
            Container(
              // decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(10), )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  //maxLength: 6,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: pass,
                  decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.orange, width: 2.0),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.orange, width: 2.0),
                    ),
                    border: InputBorder.none,
                    hintText: "",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.blue),
                    counterText: "",

                    hintStyle: TextStyle(color: Colors.blue),
                    suffixIcon: InkWell(
                      child: Icon(
                        pass ? Icons.lock : Icons.lock_open,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        pass = !pass;

                        setState(() {});
                        print("boolean value $pass");
                      },
                    ),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.white)),
                  ),
                  style: TextStyle(color: Colors.black, letterSpacing: 0),
                ),
              ),
            ),
            //  child: Padding(

            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   child: TextField(controller: controller,
            //   maxLength: 6,

            //       keyboardType: TextInputType.number,
            //       decoration: const InputDecoration(
            //           hintText: "xxxxxx",
            //   border: OutlineInputBorder(

            //   ),

            //         counterText: "",

            //         hintStyle: TextStyle(color: Colors.white),
            //   labelText: "Enter OTP",

            //   suffixIcon:
            //    Icon(Icons.phone, color: Colors.white,),

            //   ),
            //   style: TextStyle(color: Colors.white, letterSpacing: 0),

            //       ),
            //       ),

            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 340,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  enabledMouseCursor: MouseCursor.uncontrolled,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder:(_)=> PhoneAuth(),));
                  //employee=="employee@cyfuture.com"?Navigator.push(context, MaterialPageRoute(builder:(_)=> VisitorForm(),)):Navigator.push(context, MaterialPageRoute(builder:(_)=> PhoneAuth(),));
                  if (employee == emailController.text) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => VisitorForm()),
                        (Route<dynamic> route) => false);
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(_)=> VisitorForm())route=>false);
                  } else if (guard == emailController.text) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Dashboard(),
                        ));
                  } else {
                    // Fluttertoast.showToast(
                    //     msg: "invalid username/password",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     timeInSecForIosWeb: 1,
                    //     //backgroundColor: Colors.red,
                    //     textColor: Colors.red,
                    //     fontSize: 16.0);
                    // SnackBar(content: Text("invalid username"));
                  }
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                label: Text("Login", style: TextStyle(color: Colors.white)),
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
          ],
        ),
      ),
    );
  }
}
