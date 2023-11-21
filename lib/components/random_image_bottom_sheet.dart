import 'package:dogs_app/components/extension.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildRandomImageBottomSheet(
    BuildContext context, String randomImageUrl) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRandomImage(context, randomImageUrl),
              SizedBox(height: context.height * 0.02),
              buildCloseButton(context)
            ],
          ),
        );
      });
}

GestureDetector buildCloseButton(BuildContext context) {
  return GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/close_button.png"),
            );
}

Container buildRandomImage(BuildContext context, String randomImageUrl) {
  return Container(
              width: context.width * 0.65,
              height: context.height * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(randomImageUrl, fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                return Image.asset(
                  "assets/images/splash_images.png",
                  fit: BoxFit.cover,
                );
              }),
            );
}
