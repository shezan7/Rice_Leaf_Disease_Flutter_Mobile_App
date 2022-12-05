import 'dart:io';

import 'package:flutter/material.dart';

class Detection extends StatefulWidget {
  //const Detection({Key? key}) : super(key: key);

  String infectedImageFile;
  String nameOfDisease;

  Detection({required this.infectedImageFile, required this.nameOfDisease});

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {

  String nameOfDisease='';
  String filePath ='';
  late File infectedImageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameOfDisease = widget.nameOfDisease;
    filePath = widget.infectedImageFile;
    infectedImageFile = File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff295b5f),
      appBar: AppBar(
        title: Text('ধান পাতার রোগ'),
        centerTitle: true,
        backgroundColor: Color(0xff4dbac1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Color(0xff295b5f),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                filePath.isEmpty ? SizedBox(height: 0, width: 0,) :SizedBox(
                  height: 300,
                  child: Card(
                    child: Image.file(infectedImageFile),
                  ),
                ),
                Container(
                  height: 200,
                  width: 300,
                  color: Colors.white,
                  child: Card(
                    child: Center(child: Text(nameOfDisease)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
