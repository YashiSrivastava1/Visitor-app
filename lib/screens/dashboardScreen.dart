import 'package:flutter/material.dart';
import 'package:visitors_app/screens/loginPage.dart';
import 'package:visitors_app/screens/visitorList.dart';
import 'package:visitors_app/screens/visitorScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            //MainAxisAlignment: MainAxisAlignment.Center()
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhoneAuth(),
                      ));
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label:
                    Text("New Visitor", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 70,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VisitorList(),
                      ));
                },
                icon: const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                label:
                    Text("Visitor List", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
