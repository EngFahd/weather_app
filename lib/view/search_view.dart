import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text_filed.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: const CustomTextField(),
    );
  }
}
