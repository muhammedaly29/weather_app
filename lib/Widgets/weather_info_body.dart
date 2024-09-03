import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getThemeColor(weatherModel.status),
                getThemeColor(weatherModel.status)[300]!,
                getThemeColor(weatherModel.status)[50]!
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Text(
                'updated at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${weatherModel.image}',
                    height: 110,
                  ),
                  Text(
                    weatherModel.temp.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    children: [
                      Text(
                        'MaxTemp : ${weatherModel.maxTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'MinTemp : ${weatherModel.minTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                weatherModel.status,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
