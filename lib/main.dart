import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethar_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wethar_app/models/weather_model.dart';
import 'package:wethar_app/services/weather_service.dart';
import 'package:wethar_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(),
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        ),
      ),
    );
  }
}
