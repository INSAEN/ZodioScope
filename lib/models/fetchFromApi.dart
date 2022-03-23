// ignore_for_file: file_names, avoid_web_libraries_in_flutter

import 'dart:convert';

import 'package:zodiac_app/models/fetchhorro.dart';
import 'package:http/http.dart' as http;

class HorApi {
  final String sign;
  HorApi({required this.sign});
  static const _authority = "sameer-kumar-aztro-v1.p.rapidapi.com";
  static const _path = "/";
  static const Map<String, String> _headers = {
    'X-RapidAPI-Host': 'sameer-kumar-aztro-v1.p.rapidapi.com',
    'X-RapidAPI-Key': '2820853ee3mshf9b0447869d2d4cp1c6e27jsned29a81f764a'
  };

  Future<MyData> get() async {
    Uri uri =
        Uri.https(_authority, _path, {"sign": sign, "day": "today"});
    final response = await http.post(uri, headers: _headers);
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return MyData.fromJson(jsonMap);
    } else {
      throw Exception(
          "Api call returned: ${response.statusCode} ${response.reasonPhrase}");
    }
  }
}
