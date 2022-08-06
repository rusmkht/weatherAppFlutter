import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/screens/enterCityScreen/enterCityScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/ui/screens/weatherScreen/cubit/weather_screen_cubit.dart';
import 'package:flutter_weather_app/ui/screens/weatherScreen/weatherScreen.dart';

class ScreenFactory {
  Widget makeEnterCityScreen() {
    return const EnterCityScreen();
  }

  Widget makeWeatherScreen(String cityName) {
    return BlocProvider(
      create: (context) => WeatherScreenCubit(cityName: cityName),
      child: const WeatherScreen(),
    );
  }
}
