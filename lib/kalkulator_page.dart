import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController angka1Ctrl = TextEditingController();
  final TextEditingController angka2Ctrl = TextEditingController();
  final TextEditingController hasilCtrl = TextEditingController();

  void hitung(String operator) {
    double? angka1 = double.tryParse(angka1Ctrl.text);
    double? angka2 = double.tryParse(angka2Ctrl.text);

    if (angka1 == null || angka2 == null) {
      hasilCtrl.text = 'input tidak valid';
      return;
    }

    double hasil;

    switch (operator) {
      case '+':
        hasil = angka1 + angka2;
        break;
      case '-':
        hasil = angka1 - angka2;
        break;
      case '*':
        hasil = angka1 * angka2;
        break;
      case '/':
        if (angka2 == 0) {
          hasilCtrl.text = 'tidak bisa dibagi 0';
          return;
        }
        hasil = angka1 / angka2;
        break;
      default:
        hasilCtrl.text = 'operator tidak valid';
        return;
    }

    if (hasil == hasil.roundToDouble()) {
      hasilCtrl.text = hasil.toInt().toString();
    } else {
      hasilCtrl.text = hasil.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Page"),
        backgroundColor: const Color.fromARGB(255, 23, 231, 4),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: angka1Ctrl,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 85, 255, 7),
                      width: 3,
                    ),
                  ),
                  hintText: 'Masukkan Angka Pertama',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: angka2Ctrl,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 85, 255, 7),
                    width: 3,
                  ),
                ),
                hintText: 'Masukkan Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(70),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => hitung('+'),
                      style: ElevatedButton.styleFrom().copyWith(
                        overlayColor: WidgetStateProperty.all(
                          const Color.fromARGB(
                            255,
                            251,
                            180,
                            1,
                          ).withValues(alpha: 125),
                        ), // pas diklik
                      ),
                      child: Text("+", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => hitung('-'),
                      style: ElevatedButton.styleFrom().copyWith(
                        overlayColor: WidgetStateProperty.all(
                          const Color.fromARGB(
                            255,
                            127,
                            244,
                            2,
                          ).withValues(alpha: 125),
                        ), // pas diklik
                      ),
                      child: Text("-", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => hitung('*'),
                      style: ElevatedButton.styleFrom().copyWith(
                        overlayColor: WidgetStateProperty.all(
                          const Color.fromARGB(
                            255,
                            1,
                            251,
                            243,
                          ).withValues(alpha: 125),
                        ), // pas diklik
                      ),
                      child: Text("x", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => hitung('/'),
                      style: ElevatedButton.styleFrom().copyWith(
                        overlayColor: WidgetStateProperty.all(
                          const Color.fromARGB(
                            255,
                            1,
                            122,
                            251,
                          ).withValues(alpha: 125),
                        ), // pas diklik
                      ),
                      child: Text(":", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              readOnly: true,
              controller: hasilCtrl,
              decoration: InputDecoration(
                hintText: 'Hasil Operasi',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      angka1Ctrl.clear();
                      angka2Ctrl.clear();
                      hasilCtrl.clear();
                    },
                    style: ElevatedButton.styleFrom().copyWith(
                      overlayColor: WidgetStateProperty.all(
                        const Color.fromARGB(
                          255,
                          251,
                          5,
                          1,
                        ).withValues(alpha: 125),
                      ), // pas diklik
                    ),
                    child: Text("Hapus", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
