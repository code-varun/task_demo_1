// A screen that allows users to take a picture using a given camera.


import 'package:alemeno_tesk/screens/camera.dart';
import 'package:alemeno_tesk/screens/showimage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
    late var firstCamera;

  getCamera() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();
    // Get a specific camera from the list of available cameras.
    firstCamera = cameras.first;
  }

  @override
  void initState() {
   
    super.initState();

    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

     getCamera();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // Fill this out in the next steps.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.grey[300],
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
          
                  child: Image.asset("assests/images/first.png"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    
                    onPressed: () {
                      print("i m here woring ");
                      
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                            Camera(camera :firstCamera),
                              ));
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 25,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      
                      padding: EdgeInsets.all(14),
                      
                    ),
                  )
                  //   decoration: BoxDecoration(
                  //       color: Colors.green[800], shape: BoxShape.circle),

                  //       child: InkWell(
                  //         onTap: () {

                  //         },
                  //         child: Icon(
                  //           Icons.camera_alt,
                  //           color: Colors.white,
                  //           size:40,
                  //         ),
                  //       ),

                  // ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
