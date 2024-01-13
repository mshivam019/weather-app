import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/models/weather_model.dart';

import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService("8f36aa489bb280013ea4b3be2e70e2dc");
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
        return 'assets/windy.json';
      case 'smoke':
        return 'assets/windy.json';
      case 'haze':
        return 'assets/windy.json';
      case 'dust':
        return 'assets/windy.json';
      case 'fog':
        return 'assets/windy.json';
      case 'rain':
        return 'assets/rainy.json';
      case 'drizzle':
        return 'assets/rainy.json';
      case 'clear':
        return 'assets/sunny.json';
      case 'tornado':
        return 'assets/thunder.json';
      case 'squall':
        return 'assets/cloud.json';
      case 'ash':
        return 'assets/cloud.json';
      case 'sand':
        return 'assets/windy.json';
      case 'snow':
        return 'assets/snowy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_weather?.cityName ?? "Loading city"),
        Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
        Text('${_weather?.temperature.round()} °C'),
        Text(_weather?.mainCondition ?? "")
      ],
    )));
  }
}
