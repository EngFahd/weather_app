import 'package:flutter/material.dart';

class AppMethode {
  DateTime stringToTime(String valu) {
    // .hour  and .time
    return DateTime.parse(valu);
  }

  MaterialColor getColorApp(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition) {
      case "Sunny":
      case "Clear":
        return Colors.amber;

      case "Partly cloudy":
      case "Cloudy":
      case "Overcast":
        return Colors.grey;

      case "Mist":
      case "Fog":
        return Colors.blueGrey;

      case "Patchy rain possible":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain at times":
      case "Moderate rain":
      case "Heavy rain at times":
      case "Heavy rain":
      case "Light rain shower":
      case "Moderate or heavy rain shower":
      case "Torrential rain shower":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
        return Colors.blue;

      case "Patchy snow possible":
      case "Patchy light snow":
      case "Light snow":
      case "Patchy moderate snow":
      case "Moderate snow":
      case "Patchy heavy snow":
      case "Heavy snow":
      case "Light snow showers":
      case "Moderate or heavy snow showers":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.lightBlue;

      case "Patchy sleet possible":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
        return Colors.indigo;

      case "Patchy freezing drizzle possible":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
        return Colors.cyan;

      case "Thundery outbreaks possible":
        return Colors.deepPurple;

      case "Blowing snow":
      case "Blizzard":
        return Colors.blue;

      case "Freezing fog":
        return Colors.teal;

      case "Patchy light drizzle":
      case "Light drizzle":
        return Colors.blueGrey;

      case "Ice pellets":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.purple;

      default:
        return Colors.grey; // Default MaterialColor for unrecognized conditions
    }
  }
}
