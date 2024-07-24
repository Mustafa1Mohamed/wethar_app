import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wethar_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  String apiKey = "2967cbd44ab444cb937185746233007";
  final String baseUrl = "http://api.weatherapi.com/v1";
  Future<WeatherModel> getWeatherService({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      weatherCondition = weatherModel.weatherCondition;
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error, try later');
    }
  }
}

String? weatherCondition;
MaterialColor getThemeColor() {
  if (weatherCondition == null) return Colors.blue;
  if (weatherCondition == 'Sunny' ||
      weatherCondition == 'Clear' ||
      weatherCondition == 'partly cloudy') {
    return Colors.blue;
  } else if (weatherCondition == 'Blizzard' ||
      weatherCondition == 'Patchy snow possible' ||
      weatherCondition == 'Patchy sleet possible' ||
      weatherCondition == 'Patchy freezing drizzle possible' ||
      weatherCondition == 'Blowing snow') {
    return Colors.blue;
  } else if (weatherCondition == 'Freezing fog' ||
      weatherCondition == 'Fog' ||
      weatherCondition == 'Heavy Cloud' ||
      weatherCondition == 'Mist' ||
      weatherCondition == 'Fog') {
    return Colors.blueGrey;
  } else if (weatherCondition == 'Patchy rain possible' ||
      weatherCondition == 'Heavy Rain' ||
      weatherCondition == 'Showers	') {
    return Colors.blue;
  } else if (weatherCondition == 'Thundery outbreaks possible' ||
      weatherCondition == 'Moderate or heavy snow with thunder' ||
      weatherCondition == 'Patchy light snow with thunder' ||
      weatherCondition == 'Moderate or heavy rain with thunder' ||
      weatherCondition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
