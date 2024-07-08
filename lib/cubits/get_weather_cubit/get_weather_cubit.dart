import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wethar_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:wethar_app/models/weather_model.dart';
import 'package:wethar_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(super.initialState);
  getWeather({required String cityName}) async {
    WeatherModel weatherModel =
        await WeatherService(Dio()).getWeatherService(cityName: cityName);
  }
}
