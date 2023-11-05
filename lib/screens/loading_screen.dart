import 'package:clima_weather_app_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await http.get(
        'https://smaples.openweathermap.org/data/2.5/weather?/lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'
            as Uri);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
