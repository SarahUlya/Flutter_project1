import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:latihan1_11pplg1/Controllers/kalkulator_control.dart';
import 'package:latihan1_11pplg1/Routes/routes.dart';
import 'package:latihan1_11pplg1/widgets/widgets_button.dart';
import 'package:latihan1_11pplg1/widgets/widgets_textField.dart';

Widget customTextField({
  required TextEditingController textEditingController,
  required String labelText,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class CalculatorPages extends StatelessWidget {
  CalculatorPages({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("My Kalkulator Page"),),
      backgroundColor: const Color.fromARGB(255, 5, 167, 241),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextField(
            textEditingController: calculatorController.txtAngka1,
            labelText: "input angka 1",
          ),
          customTextField(
            textEditingController: calculatorController.txtAngka2,
            labelText: "input angka 2",
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "+",
                  textColor: Colors.lightBlueAccent,
                  onPressed: () {
                    calculatorController.tambah();
                  },
                ),
                CustomButton(
                  text: "-",
                  textColor: Colors.lightBlueAccent,
                  onPressed: () {
                    calculatorController.kurang();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "x",
                  textColor: Colors.lightBlueAccent,
                  onPressed: () {
                    calculatorController.kali();
                  },
                ),
                CustomButton(
                  text: ":",
                  textColor: Colors.lightBlueAccent,
                  onPressed: () {
                    calculatorController.bagi();
                  },
                ),
              ],
            ),
          ),
          //render UI berada di wrap OBX
          Obx(
            () => Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "hasil : " + calculatorController.hasil.value,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
