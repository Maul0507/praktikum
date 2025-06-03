import 'dart:ui';

import 'package:akses_resrtful_api/evaluasi/models/weather_model.dart';
import 'package:akses_resrtful_api/evaluasi/services/weather_service.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 40, fontWeight: FontWeight.w300, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white70),
          bodySmall: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with SingleTickerProviderStateMixin {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();
  String _city = 'Jakarta';
  WeatherModel? _weatherInfo;
  String? _errorMessage;
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _iconAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    setState(() {
      _weatherInfo = null;
      _errorMessage = null;
    });
    try {
      final weather = await _weatherService.fetchWeatherByCity(_city);
      setState(() {
        _weatherInfo = weather;
        _animationController.forward(from: 0.0);
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _cityController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _getBackgroundGradient(),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan nama kota',
                      hintText: 'e.g., Bangkok, Jakarta',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search, color: Colors.blue),
                        onPressed: () {
                          if (_cityController.text.isNotEmpty) {
                            setState(() {
                              _city = _cityController.text.trim();
                            });
                            _fetchWeather();
                          }
                        },
                      ),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _city = value.trim();
                        });
                        _fetchWeather();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Weather Card or Error/Loading State
                Expanded(
                  child: Center(
                    child: _buildWeatherContent(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> _getBackgroundGradient() {
    if (_weatherInfo == null) {
      return [Colors.blue[300]!, Colors.blue[600]!];
    }
    switch (_weatherInfo!.description.toLowerCase()) {
      case 'clear sky':
        return [Colors.yellow[300]!, Colors.blue[400]!];
      case 'few clouds':
      case 'scattered clouds':
        return [Colors.grey[300]!, Colors.blue[300]!];
      case 'broken clouds':
      case 'overcast clouds':
        return [Colors.grey[500]!, Colors.grey[800]!];
      case 'rain':
      case 'shower rain':
        return [Colors.blue[700]!, Colors.blueGrey[900]!];
      default:
        return [Colors.blue[300]!, Colors.blue[600]!];
    }
  }

  Widget _buildWeatherContent() {
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      );
    }

    if (_weatherInfo == null) {
      return const CircularProgressIndicator(color: Colors.white);
    }

    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _weatherInfo!.cityName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                ScaleTransition(
                  scale: _iconAnimation,
                  child: Image.network(
                    'http://openweathermap.org/img/wn/${_weatherInfo!.icon}@2x.png',
                    width: 100,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.cloud_off,
                      size: 100,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${_weatherInfo!.temperature}°C',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(
                  _weatherInfo!.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}