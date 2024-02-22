import 'dart:developer';

import 'package:bitroot_assignment/src/features/homepage/widget/search_bar_filter.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/activity_shimmer.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/send_again_shimmer.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/your_activity.dart';
import 'package:bitroot_assignment/src/model/activity_data.dart';
import 'package:bitroot_assignment/src/model/user_data.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/send_again_widget.dart';
import 'package:bitroot_assignment/src/res/assets.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgcolor,
        leading: const CustomCircularImage(image: ImageAssets.profile),
        titleSpacing: 10,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Vanessa,",
              style: TextStyle(
                  color: textcolor, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            height5,
            Text(
              "Here's your spending dashboard",
              style: TextStyle(
                  fontSize: 12, color: textcolor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          badges.Badge(
            badgeContent: const Text(
              '2',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 8, color: kwhite),
            ),
            child: GestureDetector(
              onTap: () {
                log("You Have New Notifications");
              },
              child:
                  const Icon(Icons.notifications, color: klightgrey, size: 28),
            ),
          ),
          kwidth20,
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: bgcolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.2,
                    width: Get.width,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$204.05",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: textcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Your Balance",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: kdarkgrey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        kwidth10,
                        VerticalDivider(
                          color: klightgrey.withOpacity(0.5),
                        ),
                        const Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "30",
                                    style: TextStyle(
                                        color: kblue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      size: 28, color: kblue)
                                ],
                              ),
                              Text(
                                "Last Days",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: kdarkgrey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  isLoading ? const SendShimmer() : const SendAgain(),
                ],
              ),
            ),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  CustomSearchBar(controller: searchController),
                  height10,
                  isLoading ? const ActivityShimmer() : const HomeActivity()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
