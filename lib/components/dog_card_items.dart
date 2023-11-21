import 'package:dogs_app/components/dog_breed_bottom_sheet.dart';
import 'package:dogs_app/components/extension.dart';
import 'package:dogs_app/components/generate_button.dart';
import 'package:dogs_app/views/main_page.dart';
import 'package:flutter/material.dart';

class DogCardItems extends StatelessWidget {
  const DogCardItems({
    super.key,
    required this.widget,
  });

  final MainPage widget;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.breeds.length,
      padding:
          EdgeInsets.only(left: 18, right: 18, bottom: context.height * 0.11),
      itemBuilder: (context, index) {
        String formattedBreedName = capitalize(widget.breeds[index].name);
        return buildCard(context, index, formattedBreedName);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 0),
    );
  }

  Row buildCard(BuildContext context, int index, String formattedBreedName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            buildDogBreedBottomSheet(context, index, widget.breeds[index]);
          },
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFF2F2F7))),
            elevation: 1,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: context.width * 0.415,
              height: context.height * 0.21,
              child: Stack(
                children: [
                  buildCardItemsImages(index),
                  buildCardItemsBreedName(formattedBreedName)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Positioned buildCardItemsImages(int index) {
    return Positioned.fill(
        child: Image.network(
      widget.breeds[index].image,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset(
          "assets/images/splash_images.png",
          fit: BoxFit.cover,
        );
      },
    ));
  }

  Positioned buildCardItemsBreedName(String formattedBreedName) {
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.24),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(16))),
            alignment: Alignment.center,
            child: Text(
              formattedBreedName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )));
  }
}
