import 'dart:io';

import 'package:alemeno_tesk/screens/lastscreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class Showimage extends StatefulWidget {
  Showimage(this.image, {Key? key}) : super(key: key);
  late String image;

  @override
  _ShowimageState createState() => _ShowimageState();
}



uploadImagetFirebase(String imagePath) async {
  

 await FirebaseStorage.instance
  .ref(imagePath)
  .putFile(File(imagePath))
  .then((taskSnapshot) {
    Fluttertoast.showToast(msg: "Image uploaded Succesfully" );

if (taskSnapshot.state == TaskState.success) {
  FirebaseStorage.instance
      .ref(imagePath)
      .getDownloadURL()
      .then((url) {
        
   
    print("Here is the URL of Image :" + "    " + "$url");
      
    
    return url;
  

  }).catchError((onError) {
    print("Got Error $onError");
  });
}
});

}
    
 
    



class _ShowimageState extends State<Showimage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                child: Image.asset("assests/images/second.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: CircleAvatar(
                      radius: 125.0,
                      backgroundColor: Colors.transparent,
                      child: Image.file(File(widget.image)))),
            ),
            
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Text("Will You Eat THIS ?", style: TextStyle(fontWeight: FontWeight.bold)),
                

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                 


                  uploadImagetFirebase(widget.image);
                  
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => lastscreen()));
               

                  


                },
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
