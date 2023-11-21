import 'package:dogs_app/components/extension.dart';
import 'package:dogs_app/components/generate_button.dart';
import 'package:dogs_app/models/dog_breed_model.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildDogBreedBottomSheet(
    BuildContext context, int index, DogBreed breed) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bottomSheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          shouldCloseOnMinExtent: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Center(
              child: Container(
                width: context.width * 0.88,
                height: context.height * 0.8,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    buildImageItems(breed, context),
                    SizedBox(height: context.height * 0.01),
                    buildHeaderText("Breed"),
                    SizedBox(height: context.height * 0.01),
                    buildDivider(),
                    SizedBox(height: context.height * 0.01),
                    buildBreedText(breed),
                    SizedBox(height: context.height * 0.01),
                    buildHeaderText("Sub Breed"),
                    SizedBox(height: context.height * 0.01),
                    buildDivider(),
                    SizedBox(height: context.height * 0.01),
                    buildSubbreedText(context, breed),
                    GenerateButton(
                      breed: breed,
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}

SizedBox buildSubbreedText(BuildContext context, DogBreed breed) {
  return SizedBox(
    height: context.height * 0.1,
    child: ListView.builder(
        itemCount: breed.subBreeds.length,
        itemBuilder: (context, indexed) {
          return Center(
            child: (Text(capitalize(breed.subBreeds[indexed]))),
          );
        }),
  );
}

Text buildBreedText(DogBreed breed) {
  return Text(
    capitalize(breed.name),
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  );
}

Stack buildImageItems(DogBreed breed, BuildContext context) {
  return Stack(
    children: [
      SizedBox(
        width: context.width * 0.88,
        height: context.height * 0.44,
        child: Image.network(breed.image, fit: BoxFit.cover, errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(
            "assets/images/splash_images.png",
            fit: BoxFit.cover,
          );
        }),
      ),
      Positioned(
          top: 12,
          right: 12,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/close_icon.png"),
          ))
    ],
  );
}

Divider buildDivider() {
  return const Divider(
    height: 2,
    indent: 20,
    thickness: 2,
    endIndent: 20,
    color: Color(0xFFF2F2F7),
  );
}

Text buildHeaderText(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Color(0xFF0055D3), fontSize: 20, fontWeight: FontWeight.w600),
  );
}
