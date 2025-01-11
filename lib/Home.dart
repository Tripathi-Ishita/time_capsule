import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Lottie.asset("assets/lottie/a (1).json"),
          Lottie.asset("assets/lottie/blush.json"),
          Lottie.asset("assets/lottie/sad.json"),
          Lottie.asset("assets/lottie/happy.json"),
          Lottie.asset("assets/lottie/a (5).json"),
        ],
      )
    );
  }
}
