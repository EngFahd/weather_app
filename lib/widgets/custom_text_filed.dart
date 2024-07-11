import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (valu) async {
          var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
          getWeatherCubit.getWeatherState(cityName: valu);
          Navigator.pop(context);
        },
        decoration: InputDecoration(
          // to max hight and width
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          labelText: "Search",
          hintText: "Enter City Name",
          suffixIconColor: Colors.blue,
          suffixIcon: const Icon(Icons.search),
          // default whit click click
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(16),
          ),
          // ======= > enabledBorder :  not click
        ),
      ),
    ));
  }
}
