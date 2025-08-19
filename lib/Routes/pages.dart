import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Pages/dashboard_page.dart';
import 'package:latihan1_11pplg1/Pages/football_edit_page.dart';
import 'package:latihan1_11pplg1/Pages/football_page.dart';
import 'package:latihan1_11pplg1/Pages/kalkulator_pages.dart';
import 'package:latihan1_11pplg1/Routes/routes.dart';
import 'package:latihan1_11pplg1/binding/dashboard_binding.dart';

class AppPages {
  // lisr array
  static final pages = [
    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage(),binding: DashboardBinding()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPages(),),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballedit, page: () => FootballEditPage()),
    // add other collection
  ];
}