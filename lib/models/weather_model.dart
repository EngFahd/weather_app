
class WeatherModel {
  final String city;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final DateTime time;
  final String weatherCondition;

  WeatherModel(
      {required this.city,
      this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.time,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      city: json['location']['name'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      time: DateTime.parse(json['current']['last_updated']),
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
