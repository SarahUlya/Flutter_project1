import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/kalkulator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _kalkulator() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KalkulatorPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: const Color.fromARGB(255, 91, 219, 248),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical
          crossAxisAlignment: CrossAxisAlignment.center, //horizontal
          children: [
            Text("Welcome to Home page!", style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: _kalkulator,
              child: Text("Kalkulator ->"),
            ),
          ],
        ),
      ),
    );
  }
}
