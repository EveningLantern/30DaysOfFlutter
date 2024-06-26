import 'package:flutter/material.dart';
import 'package:online_store_basics/widgets/drawers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "ChocoMist";
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: const Color(0xff6C63FF),
        //foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "CATALOG APP",
          //style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          child: const Text("Welcome to $days days Flutter Challenge by $name"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
