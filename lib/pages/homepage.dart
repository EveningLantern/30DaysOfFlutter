import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "ChocoMist";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6C63FF),
        centerTitle: true,
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Center(
        child: Container(
          child: const Text("Welcome to $days days Flutter Challenge by $name"),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
