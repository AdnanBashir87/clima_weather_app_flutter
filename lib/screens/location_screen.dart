import 'package:clima_weather_app_flutter/screens/city_screen.dart';
import 'package:clima_weather_app_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;
  const LocationScreen({
    super.key,
    required this.locationWeather,
  });

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String cityName;
  late int temperature;
  late String weatherDiscription;
  late String weatherIcon;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData != null) {
          cityName = weatherData['name'];
          double temp = weatherData['main']['temp'];
          temperature = temp.toInt();
          var condition = weatherData['weather'][0]['id'];
          weatherIcon = weatherModel.getWeatherIcon(condition);
          weatherDiscription = weatherModel.getMessage(temperature);
        } else {
          temperature = 0;
          weatherIcon = 'Error';
          weatherDiscription =
              'Something went wrong.\nPlease check and try again.';
          cityName = '';
          return;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherDataObject =
                          await weatherModel.getLocationWeather();
                      updateUI(weatherDataObject);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: kWhite,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CityScreen();
                          },
                        ),
                      );
                      print(typedName);

                      if (typedName != null){
                        var weatherData = await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: kWhite,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherDiscription in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
