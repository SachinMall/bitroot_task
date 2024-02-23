import 'dart:developer';

import 'package:bitroot_assignment/src/class/user_details.dart';
import 'package:bitroot_assignment/src/features/homepage/widget/activity_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:bitroot_assignment/src/model/user_data.dart';
import 'package:bitroot_assignment/src/utils/const.dart';

class SendAgain extends StatelessWidget {
  const SendAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Send Again",
            style: TextStyle(
                color: textcolor, fontWeight: FontWeight.w500, fontSize: 16),
          ),
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
                return GestureDetector(
                  onTap: () {
                    log(user.name);
                  },
                  child: Column(
                    children: [
                      CustomCircularImage(image: user.image),
                      height5,
                      Text(
                        user.name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12,
                            color: kdarkgrey,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularImage extends StatelessWidget {
  final String? image;
  final bool? isShimmer;
  final double? height1;
  final double? width1;

  final double? height2;
  final double? width2;
  const CustomCircularImage({
    Key? key,
    this.image,
    this.isShimmer,
    this.height1 = 70,
    this.width1 = 70,
    this.height2 = 66,
    this.width2 = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height1,
      width: width1,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kwhite, width: 4.0),
      ),
      child: isShimmer == true
          ? const ShimmerContianer()
          : Container(
              height: height2,
              width: width2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image!), fit: BoxFit.cover),
              ),
            ),
    );
  }
}
