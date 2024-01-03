import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

getRandomMeme() async {
  try {
    final responce = await http.get(
      Uri.parse("https://meme-api.com/gimme"),
    );
    if (responce.statusCode == 200) {
      return jsonDecode(responce.body.toString())['url'];
    } else {
      Fluttertoast.showToast(msg: "Internal Server Error");
      return "";
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Server Error");
    return "";
  }
}
