import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/navigation/main_navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      //home: const EnterCityScreen(),
      initialRoute: MainNavigationRouteNames.enterCity,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}
