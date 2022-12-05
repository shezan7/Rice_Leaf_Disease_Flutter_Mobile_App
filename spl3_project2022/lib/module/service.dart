import 'dart:convert';

import 'package:http/http.dart' as http;

final String url = 'http://127.0.0.1:8000/api/upload';

dynamic sendData(filePath) async {
  Map msgBody = {
    "key": "image",
    "type": "file",
    "src": filePath.toString()
  };

  try{
    var data = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(msgBody),
    );
    return json.decode(data.body);
  }catch(e){
    throw e;
  }
}