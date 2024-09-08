import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;

  GetWeatherCubit(super.initialState);

  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
