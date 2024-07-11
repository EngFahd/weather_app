import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_methode.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/view/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // exception bloc provider context
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      // exception
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                // theme: ThemeData.dark(), =======> theame App
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: AppMethode().getColorApp(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition),
                  ),
                  primarySwatch: AppMethode().getColorApp(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}
