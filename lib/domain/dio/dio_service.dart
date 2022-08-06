import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/domain/constants/constants.dart';
import 'package:flutter_weather_app/domain/models/WeatherData.dart';

class DioService {
  Dio dio = Dio();

  DioService();

  Future<WeatherData?> makeGetCityWeatherRequest(String cityName) async {
    String requestUrl = Constants.baseWeatherUrl;

    try {
      Response response = await dio.get<String>(
       
        '$requestUrl?q=$cityName&appid=${Constants.appID}&units=metric&lang=ru',
      );

      return WeatherData.fromJson(jsonDecode(response.data));
    } catch (e) {
      log(e.toString());
      if (e is DioError) {
        return WeatherData.fromJson(jsonDecode(e.response?.data));
      }
    }
    return null;
  }

}
