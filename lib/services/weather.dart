import 'package:clima_weather_app_flutter/services/location.dart';
import 'package:clima_weather_app_flutter/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather (String cityName) async{
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=93f2855e4d3517a4525d95b9a4132847&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData(); // Wait for the data
    return weatherData;
  }

  Future<dynamic> getLocationWeather ()async{
        Location location = Location();
    await location.getCurrentLocation();
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=93f2855e4d3517a4525d95b9a4132847&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData(); // Wait for the data

    return weatherData;
  }
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
}
