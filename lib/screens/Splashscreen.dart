import 'dart:async';

import 'package:alemeno_tesk/screens/Homepage.dart';
import 'package:alemeno_tesk/screens/lastscreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => 
            // lastscreen()
            Homepage()
            )));
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    'Alemeno Task 1 ',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir Next LT Pro",
                      fontSize: 34,
                      // fontSize: SizeConfig.safeBlockHorizontal * 8,
                    ),
                  ),
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                child: Image.asset("assests/images/logo.png"),
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}