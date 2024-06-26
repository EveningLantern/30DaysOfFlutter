import 'package:flutter/material.dart';
import 'package:online_store_basics/utils/routes.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String name = "";

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/login_image.png"),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(TextSpan(
                    text: "Welcome ",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: name,
                        style: const TextStyle(
                            color: Color(0xff6C63FF),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                            fontSize: 32),
                      )
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter your username",
                            labelText: "Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter the password",
                            labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be empty";
                          } else if (value.length < 6) {
                            return "Password must be atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedButton(
                  onPress: () => moveToHome(context),
                  borderRadius: 15,
                  height: 50,
                  width: 150,
                  text: 'LOGIN',
                  textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                  isReverse: true,
                  selectedTextColor: const Color.fromARGB(255, 245, 245, 246),
                  transitionType: TransitionType.RIGHT_CENTER_ROUNDER,
                  selectedBackgroundColor: const Color(0xff6C63FF),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  borderColor: const Color.fromARGB(255, 88, 67, 193),
                  borderWidth: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
