import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/navigation/screen_factory/screen_factory.dart';

class MainNavigationRouteNames {

  static const enterCity = '/';
  static const cityWeather = '/cityWeather';

}

class MainNavigation {

  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{

    MainNavigationRouteNames.enterCity: (_) =>
        _screenFactory.makeEnterCityScreen(),
    
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

       case MainNavigationRouteNames.cityWeather:
         final arguments = settings.arguments;
       final cityName = arguments is String ? arguments : '';
         return MaterialPageRoute(
            builder: (context) =>  _screenFactory.makeWeatherScreen(cityName),
          );

      default:
        const widget = Text('Navigation Error!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
