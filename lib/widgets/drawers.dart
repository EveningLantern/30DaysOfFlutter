import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store_basics/pages/loginpage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff6C63FF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture:
                  Image.asset("assets/images/profile_image.png"),
              decoration: const BoxDecoration(color: Color(0xff6C63FF)),
              margin: EdgeInsets.zero,
              accountName: const Text(
                "Chocomist",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                "chocomist@gmail.com",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
              size: 24,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              size: 24,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings_solid,
              color: Colors.white,
              size: 24,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
