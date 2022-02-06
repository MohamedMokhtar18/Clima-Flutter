import 'package:clima/services/location.dart';

import 'networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper networkHelper =
        NetworkHelper(latitude: loc.latitude, longitude: loc.longitude);
    var weatherData = await networkHelper.getByLatLonData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherByName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(cityName: cityName);
    var weatherData = await networkHelper.getByCityNameData();
    return weatherData;
  }
}
