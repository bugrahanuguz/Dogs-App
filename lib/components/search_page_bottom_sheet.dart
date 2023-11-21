  import 'package:flutter/material.dart';

void showSearchPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          snap: true,
          shouldCloseOnMinExtent: false,
          snapSizes: const [0.5, 0.9],
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Image.asset("assets/images/divider.png"),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                      maxLines: null,
                    ),
                  ),
                  // Diğer widget'lar
                ],
              ),
            );
          },
        );
      },
    );
  }