import 'package:flutter/material.dart';
import 'package:online_store_basics/pages/cart_page.dart';
import 'package:online_store_basics/pages/homepage.dart';
import 'package:online_store_basics/pages/loginpage.dart';
import 'package:online_store_basics/pages/settings.dart';
import 'package:online_store_basics/utils/routes.dart';
import 'package:online_store_basics/widgets/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.settingsRoute: (context) => MySettings(),
        MyRoutes.cartRoute: (context) => MyCart(),
      },
    );
  }
}
