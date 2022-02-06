import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'fc3085010a6767079846b64e53af134a';

const weatherHeader = 'api.openweathermap.org';
Map<String, String> paths = {'getCurrentWeather': '/data/2.5/weather'};

class NetworkHelper {
  NetworkHelper({this.latitude, this.longitude, this.cityName});
  final double latitude;
  final double longitude;
  String cityName;

  Future getByLatLonData() async {
    Map<String, String> queryParameters = {
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': apiKey,
      'units': 'metric'
    };
    return getDataJson(queryParameters);
  }

  Future getByCityNameData() async {
    Map<String, String> queryParameters = {
      'q': '$cityName',
      'appid': apiKey,
      'units': 'metric'
    };
    return getDataJson(queryParameters);
  }

  Future getDataJson(Map queryParameters) async {
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
