import 'package:bitroot_assignment/src/class/user_details.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/activity_shimmer.dart';
import 'package:bitroot_assignment/src/model/user_data.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SendShimmer extends StatelessWidget {
  const SendShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContianer(width: Get.width * 0.2),
            height10,
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: UserData.defaultuser.length,
                itemBuilder: (context, index) {
                  var user = UserDetails.fromMap(UserData.defaultuser[index]);
                  return Column(
                    children: [
                      Container(
                        height: 66,
                        width: 66,
                        // margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kblack),
                      ),
                      height5,
                      Container(
                        height: 25,
                        width: 60,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kblack,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
