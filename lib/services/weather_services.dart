// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);
  final String key = 'd8900cff9e20482da81155153232309';
  final String domain = 'https://api.weatherapi.com';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$domain/v1/forecast.json?key=$key&q=$cityName&days=10&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassages =
          e.response?.data['error']['message'] ?? "thear waas an error";

      throw Exception(errorMassages);
    } catch (e) {
      log(e.toString());
      throw Exception( "thear was an error");
    }
  }
}
