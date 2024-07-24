import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethar_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethar_app/services/weather_service.dart';
import 'package:wethar_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemDataa(),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        ),
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    ThemDataa();
    super.setState(fn);
  }

  ThemeData ThemDataa() {
    return ThemeData(
      primarySwatch: getThemeColor(),
      useMaterial3: false,
    );
  }
}
