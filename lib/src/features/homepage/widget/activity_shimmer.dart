import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ActivityShimmer extends StatelessWidget {
  const ActivityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContianer(width: Get.width * 0.5),
                  ShimmerContianer(width: Get.width * 0.2),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height5,
                  ShimmerContianer(width: Get.width * 0.3),
                  height5,
                  ShimmerContianer(width: Get.width * 0.5),
                  height5,
                  ShimmerContianer(width: Get.width * 0.55),
                  height10,
                  Divider(
                    color: kblack.withOpacity(0.2),
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShimmerContianer extends StatelessWidget {
  final double? height;
  final double? width;
  const ShimmerContianer({super.key, this.height = 12, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: kblack),
    );
  }
}
