import 'package:alemeno_tesk/screens/showimage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
 
    _controller = CameraController(

      widget.camera,
   
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
     
      body: Container( decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(35))),
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              
              return CameraPreview(_controller);
            } else {
      
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
       
        onPressed: () async {
  
          try {
     
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

         
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Showimage(
        
                   image.path,
                ),
              ),
            );
          } catch (e) {

            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
