import 'dart:developer';

import 'package:bitroot_assignment/src/features/homepage/homepage.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/search_bar_filter.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/send_again_widget.dart';
import 'package:bitroot_assignment/src/model/activity_data.dart';
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
  final List<Map<String, dynamic>> dataList = [
    {'icon': Icons.person, 'title': 'Personal Info'},
    {'icon': Icons.qr_code_scanner, 'title': 'My QR Code'},
    {'icon': Icons.apartment, 'title': 'Banks and Cards'},
    {'icon': Icons.payments, 'title': 'Payment Preferences'},
    {'icon': Icons.login, 'title': 'Automatic Payments'},
    {'icon': Icons.music_note, 'title': 'Login and Security'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
  ];

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
            CustomSearchBar(
              controller: settingcontroller,
              isActivity: false,
              hintText: 'Search Settings',
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: dataList.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        onTap: () {
                          log('${dataList[index]['title']}');
                        },
                        leading:
                            Icon(dataList[index]['icon'], color: klightgrey),
                        title: Text(
                          dataList[index]['title'],
                          style: const TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: kblue, size: 16),
                      ),
                      Divider(
                          color: kblack.withOpacity(0.1),
                          height: 0,
                          indent: 10,
                          endIndent: 12),
                    ],
                  );
                },
              ),
            ),
            height30,
          ],
        ),
      ),
    );
  }
}
