
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:spl3_project2022/module/detection_page.dart';
import 'package:spl3_project2022/module/service.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ImagePicker _picker = ImagePicker();

  int counter = 0;
  late File imageTakenFromMobile;
  List<String> nameOfDisease = ['Healthy', 'Bacterial leaf blight', 'Brown Spot', 'Leaf smut', 'Brown Spot'];
  int len = 0;
  String filePath = '';

  @override
  void initState() {
    // TODO: implement initState
    len = nameOfDisease.length;
    super.initState();
    imageTakenFromMobile = File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ধান পাতার রোগ',),
        centerTitle: true,
        backgroundColor: Color(0xff4dbac1),
      ),
      backgroundColor: Color(0xff295b5f),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Color(0xff295b5f),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                filePath.isEmpty ? SizedBox(height: 0,width: 0,) :SizedBox(
                  height: 300,
                  child: Image.file(imageTakenFromMobile),
                ),
                Card(
                  child: Column(
                    children: [
                      Icon(Icons.camera_alt_rounded, size: 100,),
                      GestureDetector(
                        onTap: () async {
                          var pickedFile = await _picker.pickImage(source: ImageSource.camera);
                        },
                          child: Container(
                            height: 30,
                            width: 100,
                            color: Color(0xff4dbac1),
                              child: Center(child: Text('ছবি তুলুন'))
                          )
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.file_open, size: 100,),
                      GestureDetector(
                          onTap: () async{
                            FilePickerResult? selectedFile =
                                await FilePicker.platform.pickFiles(allowMultiple: false);
                            filePath = selectedFile!.files.single.path!;
                            print(filePath);
                            imageTakenFromMobile = File(selectedFile.files.single.path!);
                            setState(() {});
                          },
                          child: Container(
                              height: 30,
                              width: 100,
                              color: Color(0xff4dbac1),
                              child: Center(child: Text('ছবি বের করুন'))
                          )
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    color: Color(0xff4dbac1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('রোগের তথ্য জানুন'),
                    ),
                  ),
                  onTap: (){
                    dynamic response;
                    response = sendData(filePath);
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Detection(infectedImageFile: filePath, nameOfDisease: nameOfDisease[counter%len])));
                    counter++;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}