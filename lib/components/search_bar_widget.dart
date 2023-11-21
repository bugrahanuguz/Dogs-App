import 'package:dogs_app/components/extension.dart';
import 'package:dogs_app/components/search_page_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {
            showSearchPage(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: context.height * 0.08,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFE5E5EA),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x28000000),
                  blurRadius: 16,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: buildSearchText(),
          ),
        ));
  }

  Text buildSearchText() {
    return const Text(
            "Search",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0x993C3C43)),
          );
  }
}
