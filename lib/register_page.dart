import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController tanggalLahirCtrl = TextEditingController();

  Widget customTextField(
    String hint,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: hint, border: OutlineInputBorder()),
    );
  }

  String? selectedGender;

  Widget genderRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
        ),
        Text(value),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        tanggalLahirCtrl.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  void _register() async {
    if (namaCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        passwordCtrl.text.isEmpty ||
        tanggalLahirCtrl.text.isEmpty ||
        selectedGender == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("tidak bisa registrasi"),
          content: Text("Harap lengkapi semua data!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: const Color.fromARGB(255, 71, 145, 249),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            customTextField("Nama", namaCtrl),
            SizedBox(height: 10),
            customTextField("Email/Username", emailCtrl),
            SizedBox(height: 10),
            customTextField("Password", passwordCtrl, isPassword: true),
            SizedBox(height: 15),
            Text("Jenis Kelamin", style: TextStyle(fontSize: 15)),
            genderRadio("Laki-laki"),
            SizedBox(height: 10),
            genderRadio("Perempuan"),
            SizedBox(height: 10),
            TextField(
              controller: tanggalLahirCtrl,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                hintText: "tanggal lahir",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom().copyWith(
                  overlayColor: WidgetStateProperty.all(
                    const Color.fromARGB(
                      255,
                      37,
                      145,
                      253,
                    ).withValues(alpha: 125),
                  ), // pas diklik
                ),
                child: Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
