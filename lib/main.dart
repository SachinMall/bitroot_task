import 'package:bitroot_assignment/src/features/homepage.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // textTheme: TextTheme(),
        scaffoldBackgroundColor: kwhite,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
