import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/domain/dio/dio_service.dart';
import 'package:flutter_weather_app/domain/models/WeatherData.dart';
import 'package:meta/meta.dart';

part 'weather_screen_state.dart';

class WeatherScreenCubit extends Cubit<WeatherScreenState> {

  String cityName;

  WeatherScreenCubit({required this.cityName}) : super(WeatherScreenLoadingS());

  Future<void> fetchData() async {

    DioService dioService = DioService();

    WeatherData? weatherData = await dioService.makeGetCityWeatherRequest(cityName);

    if(weatherData!=null){

      log(weatherData.cod.toString());

      if(weatherData.cod=='200'){
        emit(WeatherScreenLoadedS(weatherData: weatherData));
      }else{
        emit(WeatherScreenErrorS(error: weatherData.message));
      }
    }else{
      emit(WeatherScreenErrorS(error: 'Ошибка сети'));
    }

  }

}
