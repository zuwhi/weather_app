import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';
import 'data/data_provider/weather_data_provider.dart';
import 'data/repository/weather_repository.dart';
import 'presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
