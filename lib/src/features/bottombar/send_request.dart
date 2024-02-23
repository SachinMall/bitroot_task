import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';

class SendRequest extends StatelessWidget {
  const SendRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: const Text("Send Request"),
      ),
      body: const Center(
        child: Text(
          "No Acitivity",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: textcolor),
        ),
      ),
    );
  }
}
