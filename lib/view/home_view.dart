import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_methode.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/widgets/no_weather_info.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppMethode().getColorApp(
        //     BlocProvider.of<GetWeatherCubit>(context)
        //         .weatherModel
        //         ?.weatherCondition),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        centerTitle: false,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            // you can get data from bloc provider , but i used state beacuse i wont
            //    use (const) keyword , for i can rebuild UI
            return WeatherInfo(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text("ops thear was an error"),
            );
          }
        },
      ),
    );
  }
}
