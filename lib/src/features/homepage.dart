import 'dart:developer';

import 'package:bitroot_assignment/src/model/activity_data.dart';
import 'package:bitroot_assignment/src/model/user_data.dart';
import 'package:bitroot_assignment/src/features/send_again_widget.dart';
import 'package:bitroot_assignment/src/res/assets.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> recentActivity = ActivityData.recentactivity;
  late bool isloading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgcolor,
        title: const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomCircularImage(image: ImageAssets.profile),
          title: Text(
            "Hi Vanessa,",
            style: TextStyle(
                color: textcolor, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "Here's your spending dashboard",
            style: TextStyle(
                fontSize: 12, color: textcolor, fontWeight: FontWeight.w500),
          ),
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
        physics: const AlwaysScrollableScrollPhysics(),
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
                  const SendAgain(),
                ],
              ),
            ),
            height20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: Get.width,
                    child: TextField(
                      onTap: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        fillColor: bgcolor,
                        filled: true,
                        prefixIcon: const Icon(Icons.search, color: kblue),
                        hintText: 'Search Transactions',
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: kdarkgrey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  height10,
                  Row(
                    children: [
                      const Text(
                        "Your Activity",
                        style: TextStyle(
                            fontSize: 18,
                            color: textcolor,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sort, color: kblue),
                      ),
                    ],
                  ),
                  height10,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: isloading
                        ? 5 // Show 5 shimmering items when loading
                        : ActivityData.recentactivity.length,
                    itemBuilder: (context, index) {
                      if (isloading) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: const ShimmerItem(),
                        );
                      } else {
                        final activity = ActivityData.recentactivity[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: const TextStyle(
                              fontSize: 16,
                              color: textcolor,
                              fontWeight: FontWeight.w500),
                          subtitleTextStyle: const TextStyle(
                              fontSize: 14,
                              color: klightgrey,
                              fontWeight: FontWeight.w400),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                activity['product'].toString(),
                              ),
                              Text(
                                '\$${activity['price']}'.toString(),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height5,
                              Text(
                                activity['store'].toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: textcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              height5,
                              Text(
                                activity['time'].toString(),
                              ),
                              height5,
                              Text(
                                activity['add'].toString(),
                              ),
                              height10,
                              Divider(
                                color: kblack.withOpacity(0.2),
                                thickness: 0.5,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class NewShimmerCard extends StatelessWidget {
//   const NewShimmerCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Row(
//           children: [
//             Expanded(
//               child: ShimmerContainer(height: 12),
//             ),
//             Spacer(),
//             Expanded(
//               child: ShimmerContainer(height: 12),
//             ),
//           ],
//         ),
//         ShimmerContainer(height: 12, width: Get.width * 0.25),
//         ShimmerContainer(height: 12, width: Get.width * 0.5),
//         ShimmerContainer(height: 12, width: Get.width * 0.55),
//       ],
//     );
//   }
// }

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Search Results for: $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('Search Suggestions');
  }
}

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 12,
            width: 100, // Set a fixed width for the shimmer effect
          ),
          SizedBox(
            height: 12,
            width: 50,
            // Set a fixed width for the shimmer effect
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height5,
          const SizedBox(
            height: 12,
            width: 150, // Set a fixed width for the shimmer effect
          ),
          height5,
          const SizedBox(
            height: 12,
            width: 80, // Set a fixed width for the shimmer effect
          ),
          height5,
          const SizedBox(
            height: 12,
            width: 120, // Set a fixed width for the shimmer effect
          ),
          height10,
          Divider(
            color: kblack.withOpacity(0.2),
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
