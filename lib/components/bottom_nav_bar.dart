import 'package:dogs_app/components/bottom_nav_bar_painter.dart';
import 'package:dogs_app/components/extension.dart';
import 'package:dogs_app/components/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(context.height * 0.125),
      painter: BottomNavBarPainter(),
      child: SizedBox(
        height: context.height * 0.125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildHomeItems(),
            _divider(),
            buildSettingItems(context),
          ],
        ),
      ),
    );
  }

  GestureDetector buildSettingItems(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildSettingBottomSheet(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/setting_icon.png"),
          const Text("Settings",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }

  Padding _divider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Image.asset("assets/icons/divider.png"),
    );
  }

  Column buildHomeItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/home_icon.png"),
        const Text("Home",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0055D3)))
      ],
    );
  }
}
