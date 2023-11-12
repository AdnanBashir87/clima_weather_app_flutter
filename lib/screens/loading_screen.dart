import 'package:clima_weather_app_flutter/screens/location_screen.dart';
import 'package:clima_weather_app_flutter/services/weather.dart';
import 'package:clima_weather_app_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      var weatherData =
          await WeatherModel().getLocationWeather(); // Wait for the data
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
                locationWeather: weatherData); // Pass the data
          },
        ),
      );
    } catch (e) {
      print('Error: $e'); // Handle any potential errors
      // You might want to display an error or retry option here
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: kWhite,
          size: 100,
        ),
      ),
    );
  }
}
