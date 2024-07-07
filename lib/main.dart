import 'package:flutter/material.dart';
import 'package:online_store_basics/core/store.dart';
import 'package:online_store_basics/pages/cart_page.dart';
import 'package:online_store_basics/pages/homepage.dart';
import 'package:online_store_basics/pages/loginpage.dart';
import 'package:online_store_basics/pages/settings.dart';
import 'package:online_store_basics/utils/routes.dart';
import 'package:online_store_basics/widgets/drawers.dart';
import 'package:online_store_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MainApp()));
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
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.settingsRoute: (context) => const MySettings(),
        MyRoutes.cartRoute: (context) => const MyCart(),
        MyRoutes.drawerRoute: (context) => const MyDrawer(),
      },
    );
  }
}
