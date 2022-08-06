import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/domain/constants/constants.dart';
import 'package:flutter_weather_app/ui/screens/weatherScreen/cubit/weather_screen_cubit.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherScreenCubit weatherScreenCubit = context.read<WeatherScreenCubit>();

    weatherScreenCubit.fetchData();

    return BlocBuilder<WeatherScreenCubit, WeatherScreenState>(
      builder: (context, state) {

        if (state is WeatherScreenLoadingS) {

          return  Scaffold(
            body: Center(
              child: SpinKitCubeGrid(color: Theme.of(context).primaryColor,),
            ),
          );

        } else if (state is WeatherScreenLoadedS) {

          return Scaffold(
            appBar: AppBar(),
            body: _MyBodyWidget(
              state: state,
            ),
          );

        } else if (state is WeatherScreenErrorS) {

          Future.delayed(const Duration(milliseconds: 500), () {
            ScaffoldMessenger.of(context)
                .showSnackBar(_mySnackBar('${state.error}'.toUpperCase()));
          });

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.grey,
            ),
            body: const Center(child: Text("Ошибка при получении данных")),
          );

        } else {

          return const SizedBox();

        }
      },
    );
  }
}

SnackBar _mySnackBar(String text) {
  return SnackBar(content: Text(text));
}

class _MyBodyWidget extends StatelessWidget {
  WeatherScreenLoadedS state;

  _MyBodyWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${state.weatherData.name}"),
          ),
          Image.network("${Constants.baseIconUrl}" + "${state.weatherData.weather?[0].icon}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${state.weatherData.main?.temp}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${state.weatherData.weather?[0].description}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Макс: ${state.weatherData.main?.tempMax}"),
                const SizedBox(width: 10,),
                Text("Мин: ${state.weatherData.main?.tempMin}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
