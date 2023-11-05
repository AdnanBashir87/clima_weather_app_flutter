import 'package:clima_weather_app_flutter/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ClimaWeather());

class ClimaWeather extends StatelessWidget {
  const ClimaWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
