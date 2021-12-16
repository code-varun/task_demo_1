import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lastscreen extends StatefulWidget {
  const lastscreen({ Key? key }) : super(key: key);

  @override
  _lastscreenState createState() => _lastscreenState();
}

class _lastscreenState extends State<lastscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Image.asset("assests/images/third.png"),
           ),
      )
    ))
      
    ;
  }
}