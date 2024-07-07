import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_store_basics/core/store.dart';
import 'package:online_store_basics/models/cart.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:online_store_basics/utils/routes.dart';
import 'package:online_store_basics/widgets/drawers.dart';
import 'package:online_store_basics/widgets/home_widgets/catalog_header.dart';
import 'package:online_store_basics/widgets/home_widgets/catalog_list.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  final url = "https://api.jsonbin.io/v3/qs/668140b9acd3cb34a85f5b4b";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    /* Future<http.Response> fetchCatalog() {
      return http.get(
          Uri.parse('https://api.jsonbin.io/v3/qs/668140b9acd3cb34a85f5b4b'));
    }*/

    // final response = await fetchCatalog();
    //final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: "Magic Cart"
              .text
              .xl5
              .bold
              .color(context.theme.primaryColor)
              .make(),
        ),
        endDrawer: MyDrawer(),
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: (context, _cart, mutations) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: const Icon(CupertinoIcons.cart),
          ).badge(color: Vx.red400, size: 22, count: cart.items.length),
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
