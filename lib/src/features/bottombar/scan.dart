import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';

class ScanReceipt extends StatelessWidget {
  const ScanReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: const Text("Scan Receipt"),
      ),
    );
  }
}
