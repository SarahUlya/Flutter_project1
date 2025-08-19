import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Pages/kalkulator_pages.dart';
import 'package:latihan1_11pplg1/Routes/pages.dart';
import 'package:latihan1_11pplg1/Routes/routes.dart';
import 'package:latihan1_11pplg1/login_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.dashboard,
      getPages: AppPages.pages,
    );
  }
}
