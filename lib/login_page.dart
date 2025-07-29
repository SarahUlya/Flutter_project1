// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/home_page.dart';
import 'package:latihan1_11pplg1/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void _login() async {

    if (userController.text == 'admin' && passController.text == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("username atau password salah")));
    }
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN PAGE"), backgroundColor: Colors.amber),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome to our first App",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 1, 165, 253),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text("Please login using your email and password"),
            ),
            // image dari resource
            Center(
              child: Image.asset(
                'asset/insta.jpeg',
                errorBuilder: (context, error, stackTrace) {
                  return Text('Gambar gagal dimuat');
                },
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ),
            // isian username dan password
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: userController,
                decoration: InputDecoration(hintText: 'Masukkan username'),
              ),
            ),

            TextField(
              controller: passController,
              decoration: InputDecoration(hintText: 'Masukkan password'),
              obscureText: true,
            ),
            // style : hint, hidden char for password
            // button login, style nya bebas
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(onPressed: _login, child: Text('Login')),
                //onPressed: () {
                //if(userController.text == "admin" && passController.text == "admin"){
                //setState((){
                //statusLogin = "sukses  login";
                //print(statusLogin);
                //});
                //} else {
                //setState((){
                //statusLogin = "gagal  login";
                //print(statusLogin);
                //});
                //}
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(child: Text("Belum punya akun? Register dulu ")),
            ),
            Center(
              child: InkWell(
                onTap: _register,
                child: Text(
                  "Registrasi",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
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
