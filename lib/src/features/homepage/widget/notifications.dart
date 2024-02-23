import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: const Text("Notifications"),
      ),
      body: const Center(
        child: Text(
          "No New Notifications",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: textcolor),
        ),
      ),
    );
  }
}
