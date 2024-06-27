import 'package:flutter/material.dart';
import 'package:online_store_basics/pages/homepage.dart';
import 'package:online_store_basics/pages/loginpage.dart';
import 'package:online_store_basics/utils/routes.dart';
import 'package:online_store_basics/widgets/themes.dart';

void main() {
  runApp(const MainApp());
}

bool isDark = true;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.settingsRoute: (context) => const HomePage(),
      },
    );
  }
}
