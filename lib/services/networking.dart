import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const apiKey = 'fc3085010a6767079846b64e53af134a';

const weatherHeader = 'api.openweathermap.org';
Map<String, String> paths = {'getCurrentWeather': '/data/2.5/weather'};

class NetworkHelper {
  NetworkHelper({@required this.latitude, @required this.longitude});
  final double latitude;
  final double longitude;

  Future getData() async {
    Map<String, String> queryParameters = {
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': apiKey
    };
    Uri url =
        Uri.http(weatherHeader, paths['getCurrentWeather'], queryParameters);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
