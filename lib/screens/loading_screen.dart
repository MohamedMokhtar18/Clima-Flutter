import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void initState() {
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    latitude = loc.latitude;
    longitude = loc.longitude;
    NetworkHelper networkHelper =
        NetworkHelper(latitude: latitude, longitude: longitude);
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }
}
