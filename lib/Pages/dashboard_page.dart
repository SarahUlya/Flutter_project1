import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Controllers/dashboard_controller.dart';
import 'package:latihan1_11pplg1/Pages/football_page.dart';
import 'package:latihan1_11pplg1/Pages/kalkulator_pages.dart';
import 'package:latihan1_11pplg1/Pages/profile_page.dart';
import 'package:latihan1_11pplg1/home_page.dart';
import 'package:latihan1_11pplg1/kalkulator_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                CalculatorPages(),
                FootballPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.plus_slash_minus,
                label: 'Kalkulator',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.list_bullet,
                label: 'Football players',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person_circle,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
