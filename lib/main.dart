import 'package:dogs_app/service/dog_service.dart';
import 'package:dogs_app/viewmodels/dog_bloc.dart';
import 'package:dogs_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: "Galano Grotesque"),
      home: BlocProvider(
          create: (BuildContext context) => DogBloc(DogService()),
          child: const SplashScreen()),
    );
  }
}
