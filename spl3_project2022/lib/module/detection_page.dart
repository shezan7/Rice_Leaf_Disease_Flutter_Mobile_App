import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spl3_project2022/module/home_page.dart';

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
  late int counter = 0;

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
                SizedBox(height: 40,),
                filePath.isEmpty ? SizedBox(height: 0, width: 0,) : Padding(padding: EdgeInsets.only(top: 10), child: SizedBox(
                  height: 300,
                  child: Card(
                    child: Image.file(infectedImageFile),
                  ),)
                ),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.white,
                  child: Card(
                    child: Center(child: Text(nameOfDisease)),
                  ),
                ),
                filePath.isEmpty? Container(): SizedBox(height: 40,),
                // filePath.isEmpty? Container():GestureDetector(
                //   child: Container(
                //     color: Color(0xff4dbac1),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text('আগের পেজে ফিরে যান', style: TextStyle(color: Colors.white, fontSize: 20)),
                //     ),
                //   ),
                //   onTap: (){
                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
