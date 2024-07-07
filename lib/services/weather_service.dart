import 'package:dio/dio.dart';
import 'package:wethar_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  String apiKey = "2967cbd44ab444cb937185746233007";
  final String baseUrl = "http://api.weatherapi.com/v1";
  Future<WeatherModel?> getWeatherService({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } catch (e) {
      return null;
    }
  }
}
