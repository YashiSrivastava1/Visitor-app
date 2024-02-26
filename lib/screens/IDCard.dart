import 'dart:io';

import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  final String name;

  final String purposeOfVisit;

  final File? image;

  const PrintScreen({
    required this.name,
    required this.purposeOfVisit,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
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
              Text("Visitor's Pass"),

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
      body: Container(
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
            SizedBox(height: 20),
            Text(
              "Host Name",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "host name",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              "Purpose of Visit",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              widget.purposeOfVisit,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
