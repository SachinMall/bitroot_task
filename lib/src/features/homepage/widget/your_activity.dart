import 'package:bitroot_assignment/src/model/activity_data.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';

import '../../../class/activity_details.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: ActivityData.recentactivity.length,
      itemBuilder: (context, index) {
        var activity =
            ActivityDetails.fromMap(ActivityData.recentactivity[index]);
        return ListTile(
          contentPadding: EdgeInsets.zero,
          titleTextStyle: const TextStyle(
              fontSize: 16, color: textcolor, fontWeight: FontWeight.w500),
          subtitleTextStyle: const TextStyle(
              fontSize: 14, color: klightgrey, fontWeight: FontWeight.w400),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activity.product,
              ),
              Text(
                '\$${activity.price}',
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height5,
              Text(
                activity.store,
                style: const TextStyle(
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w600),
              ),
              height5,
              Text(
                activity.time,
              ),
              height5,
              Text(
                activity.add,
              ),
              height10,
              Divider(
                color: kblack.withOpacity(0.2),
                thickness: 0.5,
              ),
            ],
          ),
        );
      },
    );
  }
}
