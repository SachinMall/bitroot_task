import 'package:avatar_glow/avatar_glow.dart';
import 'package:bitroot_assignment/src/class/user_details.dart';
import 'package:bitroot_assignment/src/features/homepage/homepage.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/send_again_widget.dart';
import 'package:bitroot_assignment/src/res/assets.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final bool _animate = true;
  @override
  Widget build(BuildContext context) {
    final UserDetails user = Get.arguments as UserDetails;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: klightblue,
              padding: EdgeInsets.only(top: Get.height * 0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AvatarGlow(
                    startDelay: const Duration(milliseconds: 500),
                    glowColor: Colors.white,
                    glowShape: BoxShape.circle,
                    glowRadiusFactor: 2,
                    animate: true,
                    curve: Curves.fastOutSlowIn,
                    child: CustomCircularImage(
                      height1: 90,
                      width1: 90,
                      height2: 86,
                      width2: 86,
                      image: user.image,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.3),
                  const Text(
                    "Paying",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kwhite),
                  ),
                  height5,
                  Text(
                    user.name,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kwhite),
                  ),
                  height15,
                  ElevatedButton(
                    onPressed: () {
                      Get.off(() => const HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      elevation: 0,
                      fixedSize: Size(Get.width * 0.5, 40),
                      backgroundColor: kwhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Cancel Payment",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kblack),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
