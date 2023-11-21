import 'package:dogs_app/viewmodels/dog_bloc.dart';
import 'package:dogs_app/viewmodels/dog_event.dart';
import 'package:dogs_app/viewmodels/dog_state.dart';
import 'package:dogs_app/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late DogBloc _dogBloc;
  @override
  void initState() {
    super.initState();
    _dogBloc =
        BlocProvider.of<DogBloc>(context); 
    _dogBloc.add(DogEventLoadBreeds());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<DogBloc, DogState>(
          listener: (context, state) {
            if (state is DogBreedsLoaded) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainPage(
                  breeds: state.breeds,
                ),
              ));
            } else if (state is DogError) {
              Text('Hata: ${state.message}');
            }
          },
          child: Image.asset("assets/images/splash_images.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dogBloc.close();
    super.dispose();
  }
}
