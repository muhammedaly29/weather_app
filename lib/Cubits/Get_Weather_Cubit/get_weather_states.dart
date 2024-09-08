import 'package:weather_app/Models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
