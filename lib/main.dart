import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:time_capsule/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0.0), // Start from the right of the icon
      end: Offset(0.0, 0.0),   // Slide to its final position next to the icon
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the controller
    _controller.forward();

    // Delay the transition to the home screen
    Future.delayed(Duration(seconds: 4), _navigateToHome);
  }

  // @override
  // void initState(){
  //   super.initState();
  //   _startTimer();
  // }
  // void _startTimer(){
  //   Timer(Duration(seconds: 3),_navigateToHome);
  // }
  void _navigateToHome(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpeg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/spl.png"),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) => Opacity(
                      opacity: _opacityAnimation.value,
                      child: child,
                    ),
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      height: 70,
                      width: 70,
                    ),
                  ),
                  SizedBox(width: 10), // Space between the icon and text
                  SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      "Vesper Vault",
                      style: GoogleFonts.majorMonoDisplay(
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text("Sealing Memories, unlocking smiles ",style: GoogleFonts.dancingScript(textStyle: TextStyle(
              //     fontSize: 22,fontWeight: FontWeight.bold,color: Colors.green[700]
              // )),),
            ],
          ),
        ),
      ),
    );
  }
}
