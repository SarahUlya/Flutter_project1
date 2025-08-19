import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/Controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings{

void dependencies(){
    Get.lazyPut<DashboardController>(() => DashboardController());
  }

}

