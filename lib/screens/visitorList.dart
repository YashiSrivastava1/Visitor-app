import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors_app/Controllers/baseAPI.dart';
import 'package:visitors_app/Providers/VisitorListProvider.dart';
import 'package:visitors_app/screens/exitCard.dart';
import 'package:visitors_app/screens/visitorScreen.dart';
String stringResponse="";
Map mapResponse={};
List<dynamic> dataList =[];
class VisitorList extends StatefulWidget {
  const VisitorList({super.key});
  
  @override
  State<VisitorList> createState() => _VisitorListState();
}

class _VisitorListState extends State<VisitorList> {

Future getVisitorList() async {
   var endpoint='getVisitor';
  var baseUrl= BaseApi().baseApi;
  var finalUrl=baseUrl+endpoint;
  
  http.Response response;
 response =await http.get(Uri.parse(finalUrl));

 print("object ${response.statusCode}");

 print("data here : ${response}");


 if(response.statusCode==200)
 {
      // stringResponse=response.body;
       mapResponse=json.decode(response.body) ;
 dataList = mapResponse['data'];
//  final todos=json.dataList((e){
//   return Todo{
    

//   msq: e['msq'],
//   data: e['data'],
//   flag: e['flag'],
//   statusCode: e['statusCode'],

//   };
//  }).toList();
//  return todos;

            print("object ka data ${dataList.length}");

setState(() {
  
});
  
 }
}
@override
void initState()
{
  // getVisitorList();
  super.initState();
}
  
  


  @override
  Widget build(BuildContext context) {
    //final visitorProvider=Provider.of<VisitorProvider>(context);
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
          decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/blueBackgroundScreen.jpg'),
          ),
        ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            
            child
    
    : ListView.builder(
        physics: ScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExitScreen(),
                  ));
              print('Yashi $index');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1'),
                        Text('Yashi'),
                        Text('IT'),
                        Text('Manager'),
                        Text('8840850613'),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Registration'),
                      Text('Meeting'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),

          ),
        ));
  }
}

