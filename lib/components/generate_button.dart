import 'package:dogs_app/components/extension.dart';
import 'package:dogs_app/components/random_image_bottom_sheet.dart';
import 'package:dogs_app/models/dog_breed_model.dart';
import 'package:dogs_app/service/dog_service.dart';
import 'package:dogs_app/viewmodels/dog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    Key? key,
    required this.breed,
  }) : super(key: key);
  final DogBreed breed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DogBloc(DogService()),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<DogBloc>(context, listen: false)
                .randomDogImage(breed.name);
            String randomImageUrl =
                BlocProvider.of<DogBloc>(context, listen: false).randomImageUrl;
            buildRandomImageBottomSheet(context, randomImageUrl);
          },
          child: buildButton(context),
        );
      }),
    );
  }

  Container buildButton(BuildContext context) {
    return Container(
          width: context.width * 0.8,
          height: context.height * 0.072,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFF0085FF),
              borderRadius: BorderRadius.circular(8)),
          child: buildButtonText(),
        );
  }

  Text buildButtonText() {
    return const Text(
            "Generate",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          );
  }
}

String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
