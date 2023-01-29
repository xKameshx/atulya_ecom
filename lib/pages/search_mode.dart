import 'dart:io';

import 'package:atulya_app/pages/cam.dart';
import 'package:atulya_app/widget/tf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Smode extends StatefulWidget {
  Smode({Key? key}) : super(key: key);

  @override
  _SmodeState createState() => _SmodeState();
}

class _SmodeState extends State<Smode> {
  MyHomePage my = MyHomePage();
  late File fileImage;
  final picker = ImagePicker();
  var but = Icons.camera_alt;
  bool uploading = false, boli = false;
  // var _search;
  TextEditingController _controller = new TextEditingController();

  selectPic(mcontext) {
    return showDialog(
        context: mcontext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Images",
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: Text(
                  "Capture with camera",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: capturewithcamera,
              ),
              SimpleDialogOption(
                child: Text(
                  "Select from gallery",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: photofromgallery,
              )
            ],
          );
        });
  }

  capturewithcamera() async {
    Navigator.pop(context);
    XFile? imageFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() async {
      fileImage = File(imageFile!.path);
      var st = await my.classifyImage(imageFile.path);
      boli = true;
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => AddData(st)));
    });
  }

  photofromgallery() async {
    Navigator.pop(context);
    XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() async {
      fileImage = File(imageFile!.path);
      var st = await my.classifyImage(imageFile.path);
      //print(st);
      boli = true;

      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => AddData(st.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        child: Stack(
          children: [
            Positioned(
                top: 40,
                left: 5,
                child: IconButton(
                  iconSize: 35,
                  onPressed: () =>
                      Navigator.pop(context), // => CameraApp(cameras),
                  icon: Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.black,
                  ),
                )),
            Positioned(
                top: 95,
                right: 10,
                child: IconButton(
                  iconSize: 25,
                  onPressed: () => setState(() {
                    if (but == Icons.clear_rounded) {
                      but = Icons.camera_alt;
                      _controller.clear();
                    } else {
                      selectPic(context);
                    }
                  }), // => CameraApp(cameras),
                  icon: Icon(
                    but,
                    color: Colors.lightBlueAccent,
                  ),
                )),
            Positioned(
                top: 100,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25),
                      border: Border.all(color: Colors.lightBlueAccent)),
                  child: TextField(
                    onSubmitted: (value) => {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(
                          builder: (context) => AddData(value)))
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: GoogleFonts.lato(
                          color: Colors.grey[300], fontSize: 16),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        size: 20,
                      ),
                    ),
                    onTap: () => setState(() {
                      but = Icons.clear_rounded;
                    }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
