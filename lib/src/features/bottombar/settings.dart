import 'package:bitroot_assignment/src/features/homepage/homepage.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/search_bar_filter.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/send_again_widget.dart';
import 'package:bitroot_assignment/src/res/assets.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController settingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Get.off(() => const HomePage());
            },
            child: const Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 16, color: kblue, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: bgcolor,
              child: const Column(
                children: [
                  CustomCircularImage(
                      height1: 90,
                      width1: 90,
                      height2: 86,
                      width2: 86,
                      image: ImageAssets.profile),
                  height10,
                  Text(
                    "Mae Jamison",
                    style: TextStyle(
                        fontSize: 18,
                        color: textcolor,
                        fontWeight: FontWeight.w600),
                  ),
                  height5,
                  Text(
                    "maej@gmail.com",
                    style: TextStyle(
                        fontSize: 14,
                        color: textcolor,
                        fontWeight: FontWeight.w500),
                  ),
                  height30,
                ],
              ),
            ),
            height20,
            CustomSearchBar(controller: settingcontroller)
          ],
        ),
      ),
    );
  }
}
