import 'dart:convert';
import 'package:akses_resrtful_api/evaluasi/models/weather_model.dart';
import 'package:http/http.dart' as http;


class WeatherService {
  static const String apiKey = 'b82eb409689abb4bdf8ef1a3a0fe3df9';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherModel> fetchWeatherByCity(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<WeatherModel> fetchWeatherByLocation(double lat, double lon) async {
    final response = await http.get(Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}