import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/screens/forecast.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getLocationData() async {
    try {
      var weatherInfo = await WeatherAPI().fetchWeatherForecast();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(locationWeather: weatherInfo);
      }));
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.deepPurple[300], size: 100.0),
      ),
    );
  }
}