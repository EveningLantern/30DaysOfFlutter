import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:online_store_basics/widgets/drawers.dart';
import 'package:online_store_basics/widgets/item_widget.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "CATALOG APP",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}

@override
@override
void initState() {
  initState();
  loadData();
}

loadData() async {
  var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  print(catalogJson);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
