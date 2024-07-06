import 'package:flutter/material.dart';
import 'package:wethar_app/widgets/no_wethar_body.dart';
import 'package:wethar_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blue,
      ),
      body: const WeatherInfoBody(),
    );
  }
}
