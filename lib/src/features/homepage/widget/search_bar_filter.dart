import 'package:bitroot_assignment/src/model/activity_data.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final bool? isActivity;
  final String hintText;
  final TextEditingController controller;
  final List<Map<String, dynamic>>? recentActivity;

  const CustomSearchBar(
      {Key? key,
      required this.controller,
      this.isActivity = true,
      required this.hintText,
      this.recentActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Get.width * 0.85,
          child: TextField(
            onTap: () {
              showSearch(
                context: context,
                delegate:
                    CustomSearchDelegate(suggestions: recentActivity ?? []),
              );
            },
            controller: controller,
            decoration: InputDecoration(
              fillColor: bgcolor,
              filled: true,
              contentPadding: EdgeInsets.zero,
              prefixIcon: const Icon(Icons.search, color: kblue),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: kdarkgrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        height10,
        if (isActivity!)
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
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> suggestions;

  CustomSearchDelegate({required this.suggestions});

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
    final suggestionList = query.isEmpty
        ? suggestions
        : suggestions
            .where((activity) =>
                activity['product']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                activity['store']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                activity['add']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                activity['price']
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion['product'].toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Store: ${suggestion['store']}'),
              Text('Add: ${suggestion['add']}'),
              Text('Price: \$${suggestion['price']}'),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}
