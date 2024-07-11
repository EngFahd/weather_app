import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_methode.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return
        //gridant Color
        Container(
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          AppMethode().getColorApp(BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherCondition),
          AppMethode().getColorApp(BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherCondition)[300]!,
          AppMethode().getColorApp(BlocProvider.of<GetWeatherCubit>(context)
              .weatherModel
              ?.weatherCondition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
              "last apdated  ${weatherModel.time.hour}:${weatherModel.time.minute}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https:${weatherModel.image}"),
              Text(
                " ${weatherModel.temp}",
                style: const TextStyle(fontSize: 20),
              ),
              Column(
                children: [
                  // round method() ==>> 22.9 > 22
                  Text("MaxTemp : ${weatherModel.maxTemp.round()}"),
                  Text("MinTemp : ${weatherModel.minTemp.round()}")
                ],
              )
            ],
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }
}
