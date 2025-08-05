import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:latihan1_11pplg1/Controllers/kalkulator_control.dart';
import 'package:latihan1_11pplg1/widgets/widgets_button.dart';
import 'package:latihan1_11pplg1/widgets/widgets_textField.dart';

class CalculatorPages extends StatelessWidget {
CalculatorPages({super.key});

  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator 2"),),
      body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextField(textEditingController: calculatorController.txtAngka1, labelText: "input angka 1"),
          customTextField(textEditingController: calculatorController.txtAngka2, labelText: "input angka 2"),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
            children: [
              CustomButton(text: "+", textColor: Colors.lightBlueAccent, onPressed: (){
                calculatorController.tambah();
              }),
              CustomButton(text: "-", textColor: Colors.lightBlueAccent, onPressed: (){
                calculatorController.kurang();
              }),
            ],
          )
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
            children: [
              CustomButton(text: "x", textColor: Colors.lightBlueAccent, onPressed: (){
                calculatorController.kali();
              }),
              CustomButton(text: ":", textColor: Colors.lightBlueAccent, onPressed: (){
                calculatorController.bagi();
              }),
            ],
          )
          ),
          //render UI berada di wrap OBX
          Obx(() => Text("hasil : "+calculatorController.hasil.value)),
          CustomButton(text: "Clear", textColor: Colors.blue, onPressed: (){
            calculatorController.hapus();
          })
        ],
      ),
    )
    );
  }
}