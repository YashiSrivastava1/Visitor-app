import 'dart:io';

import 'package:flutter/material.dart';

class HostScreen extends StatefulWidget {
  final String name;
  //final String hostName;
  final String purposeOfVisit;
  final String department;
  
  final String company;
  final String companyAdd;
  final String id;
  final String idNumber;
  final String time;
  final File? image;
  

  const HostScreen({
    required this.name,
    required this.purposeOfVisit,
    required this.department,
    required this.image,
    //required this.hostName,
    required this.company,
    required this.companyAdd,
    required this.id,
    required this.idNumber,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
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
              Text("Host Validation"),

// Image.asset(

// 'assets/images/cyflogo.jpeg',

// fit: BoxFit.contain,

// ),

              SizedBox(
                width: 60,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Color.fromARGB(255, 191, 227, 242),
                Color.fromARGB(255, 255, 255, 255),
              ],
            ),
            border: Border.all(color: Colors.blue, width: 5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                child: Image.asset(
                  'assets/CyFutureLogo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
        
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5),
                  borderRadius: BorderRadius.circular(10),
                ),
        
                height: 200,
        
                width: 200,
        
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: widget.image != null
                      ? Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        )
                      : Placeholder(),
                ), // Placeholder if image is null
              ),
              SizedBox(height: 20),
              Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.name,
                style: TextStyle(fontSize: 25),
              ),
              // SizedBox(height: 20),
              // Text(
              //   "Host Name",
              //   style: TextStyle(fontSize: 20),
              // ),
              // Text(
              //   widget.hostName,
              //   style: TextStyle(fontSize: 25),
              // ),
              SizedBox(height: 20),
              Text(
                "Purpose of Visit",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.purposeOfVisit,
                style: TextStyle(fontSize: 25),
              ),
        
              SizedBox(height: 20),
              Text(
                "Department Of Visit",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.department,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              Text(
                "Company Name",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.company,
                style: TextStyle(fontSize: 25),
              ),
               SizedBox(height: 20),
              Text(
                "Company Address",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.companyAdd,
                style: TextStyle(fontSize: 25),
              ),
               SizedBox(height: 20),
              Text(
                "ID Type",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.id,
                style: TextStyle(fontSize: 25),
              ),
                SizedBox(height: 20),
              Text(
                "ID number",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.idNumber,
                style: TextStyle(fontSize: 25),
              ),
               SizedBox(height: 20),
              Text(
                "Time of entry",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.time,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
