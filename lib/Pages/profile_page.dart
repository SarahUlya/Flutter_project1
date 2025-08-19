import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Kalkulator Page"),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 167, 241),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/kucing2.jpg',
              errorBuilder: (context, error, stackTrace) {
                return const Text('Gambar gagal dimuat');
              },
              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20), 
            const Text(
              "My name is Sarah Hasyifah Ulya",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 236, 1, 253),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "email : sarakahbgt@gmail.com",
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 110, 110, 110),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}