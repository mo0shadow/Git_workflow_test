import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Welcome to Burando 🎉",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
    );
  }
}
