

import 'package:alemeno_tesk/controller/takepictures.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late var firstCamera;

  getCamera() async {
   
    final cameras = await availableCameras();
   
    firstCamera = cameras.first;
  }

  @override
  void initState() {
    getCamera();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("Alemeno Task1")),
            body: Center(
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                    
                            TakePictureScreen(camera: firstCamera)
                            )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green[800],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text("Share Your Meal "),
                  ),
                ),
              ),
            )));
  }
}
