import 'dart:io';
import 'package:dogs_app/components/extension.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildSettingBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            initialChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Image.asset("assets/images/divider.png"),
                    SizedBox(height: context.height * 0.1),
                    buildSettingItems(
                        context, "assets/images/help_img.png", "Help"),
                    _sizedBox(context),
                    _divider(),
                    _sizedBox(context),
                    buildSettingItems(
                        context, "assets/images/rate_us_img.png", "Rate Us"),
                    _sizedBox(context),
                    _divider(),
                    _sizedBox(context),
                    buildSettingItems(context, "assets/images/share_img.png",
                        "Share with Friends"),
                    _sizedBox(context),
                    _divider(),
                    _sizedBox(context),
                    buildSettingItems(
                        context, "assets/images/terms_img.png", "Terms of Use"),
                    _sizedBox(context),
                    _divider(),
                    _sizedBox(context),
                    buildSettingItems(context, "assets/images/privacy_img.png",
                        "Privacy Policy"),
                    _sizedBox(context),
                    _divider(),
                    _sizedBox(context),
                    Row(
                      children: [
                        SizedBox(
                            width: context.width * 0.1,
                            child:
                                Image.asset("assets/images/version_img.png")),
                        SizedBox(
                            width: context.width * 0.5,
                            child: builTextWidget("OS Version")),
                      ],
                    )
                  ],
                ),
              );
            });
      });
}

Row buildSettingItems(BuildContext context, String iconAsset, String text) {
  return Row(
    children: [
      SizedBox(width: context.width * 0.1, child: Image.asset(iconAsset)),
      SizedBox(width: context.width * 0.75, child: builTextWidget(text)),
      Image.asset("assets/images/link_img.png")
    ],
  );
}

String getAndroidVersion() {
  if (Platform.isAndroid) {
    return '${Platform.operatingSystemVersion}';
  } else if (Platform.isIOS) {
    return '${Platform.operatingSystemVersion}';
  }
  return 'Not an device';
}

SizedBox _sizedBox(BuildContext context) =>
    SizedBox(height: context.height * 0.02);

Divider _divider() {
  return Divider(
    height: 2,
    thickness: 2,
    color: Color(0xFFE5E5EA),
  );
}

Text builTextWidget(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  );
}
