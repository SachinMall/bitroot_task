import 'package:flutter/material.dart';
import 'package:bitroot_assignment/src/model/user_data.dart';
import 'package:bitroot_assignment/src/res/assets.dart';
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
                return Column(
                  children: [
                    CustomCircularImage(
                      image: UserData.defaultuser[index]['image'],
                    ),
                    height5,
                    Text(
                      UserData.defaultuser[index]['name'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 12,
                          color: kdarkgrey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
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
  final String image;
  const CustomCircularImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kwhite, width: 4.0),
      ),
      child: Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
