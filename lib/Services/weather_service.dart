import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '38bf508e4876462d832141525242706';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops , There was  an error , Try again later';

      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops , There was  an error , Try again later');
    }
  }
}
