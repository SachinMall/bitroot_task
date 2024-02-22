import 'package:bitroot_assignment/src/features/bottombar/scan.dart';
import 'package:bitroot_assignment/src/features/bottombar/send_request.dart';
import 'package:bitroot_assignment/src/features/bottombar/settings.dart';
import 'package:bitroot_assignment/src/features/homepage/homepage.dart';
import 'package:bitroot_assignment/src/utils/const.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var pageoptions = [
    const HomePage(),
    const ScanReceipt(),
    const SendRequest(),
    const Settings()
  ];

  int _currentIndex = 0;
  void onTabSwitch(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: onTabSwitch,
        selectedItemColor: kblue,
        unselectedItemColor: klightgrey,
        unselectedLabelStyle: const TextStyle(
          color: klightgrey,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 10, color: kblue),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'Scan Receipt',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_rounded),
            label: 'Send & Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
