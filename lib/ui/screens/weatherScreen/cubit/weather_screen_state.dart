part of 'weather_screen_cubit.dart';

@immutable
abstract class WeatherScreenState {}

class WeatherScreenLoadingS extends WeatherScreenState {}

class WeatherScreenLoadedS extends WeatherScreenState {

  WeatherData weatherData;

  WeatherScreenLoadedS({required this.weatherData});

}

class WeatherScreenErrorS extends WeatherScreenState {

  String? error;

  WeatherScreenErrorS({required this.error});  

}
