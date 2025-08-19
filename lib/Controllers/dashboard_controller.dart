import 'package:get/get.dart';
import 'package:latihan1_11pplg1/home_page.dart';

class DashboardController extends GetxController{
  var tabIndex = 0;

  void changeTabIndex (int index){
    tabIndex = index;
    update();
  }
  
}