import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    //https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=8f36aa489bb280013ea4b3be2e70e2dc&units=metric
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8f36aa489bb280013ea4b3be2e70e2dc&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
