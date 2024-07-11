import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeatherState({required cityName}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadingState(weatherModel!));
    } catch (e) {
      emit(WeatherFailerState());
    }
  }
}
