import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/Get_Weather_Cubit/get_weather_states.dart';
import 'package:weather_app/Views/search_view.dart';
import 'package:weather_app/Widgets/no_weather_body.dart';
import 'package:weather_app/Widgets/weather_info_body.dart';
import 'package:weather_app/main.dart';

class HomeView extends StatelessWidget {
 const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: getThemeColor(
            BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status),
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return  SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text(
                '"Oops , There was an error"',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            );
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
