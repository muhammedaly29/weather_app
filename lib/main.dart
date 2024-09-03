import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/Views/home_view.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.status),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.deepOrange;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Patchy rain possible':
      return Colors.lightGreen;
    case 'Patchy snow possible':
      return Colors.cyan;
    case 'Patchy sleet possible':
      return Colors.indigo;
    case 'Patchy freezing drizzle possible':
      return Colors.deepPurple;
    case 'Thundery outbreaks possible':
      return Colors.amber;
    case 'Blowing snow':
      return Colors.blue;
    case 'Fog':
      return Colors.grey;
    case 'Patchy light drizzle':
      return Colors.lightGreen;
    case 'Light drizzle':
      return Colors.lightGreen;
    case 'Freezing drizzle':
      return Colors.lightBlue;
    case 'Heavy freezing drizzle':
      return Colors.blue;
    case 'Patchy light rain':
      return Colors.lightGreen;
    case 'Light rain':
      return Colors.lightGreen;
    case 'Moderate rain at times':
      return Colors.green;
    case 'Moderate rain':
      return Colors.green;
    case 'Heavy rain at times':
      return Colors.lightBlue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
      return Colors.blue;
    case 'Moderate snow':
      return Colors.blue;
    case 'Patchy heavy snow':
      return Colors.blueGrey;
    case 'Light rain shower':
      return Colors.lightGreen;
    case 'Moderate or heavy rain shower':
      return Colors.green;
    case 'Torrential rain shower':
      return Colors.lightBlue;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.blue;
    case 'Patchy light rain with thunder':
      return Colors.amber;
    case 'Moderate or heavy rain with thunder':
      return Colors.red;
    case 'Patchy light snow with thunder':
      return Colors.lightBlue;
    case 'Moderate or heavy snow with thunder':
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
