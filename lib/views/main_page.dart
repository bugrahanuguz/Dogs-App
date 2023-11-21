import 'package:dogs_app/components/bottom_nav_bar.dart';
import 'package:dogs_app/components/dog_card_items.dart';
import 'package:dogs_app/components/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:dogs_app/models/dog_breed_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.breeds,
  }) : super(key: key);
  final List<DogBreed> breeds;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: buildAppBar(),
      body: Stack(children: [
        DogCardItems(widget: widget),
        const SearchBarWidget()
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          "Dogs App",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

