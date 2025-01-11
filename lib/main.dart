import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:time_capsule/Home.dart';
void main(){
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

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _startTimer();
  }
  void _startTimer(){
    Timer(Duration(seconds: 3),_navigateToHome);
  }
  void _navigateToHome(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.jpeg"),fit:BoxFit.cover)
        ),
        child:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/spl.png"),
                  height: MediaQuery.of(context).size.height*0.3,
                  ),
                  SizedBox(height: 20,),
                  Text("Vesper Vault",style: GoogleFonts.majorMonoDisplay(textStyle: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold
                  )),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Sealing Memories, unlocking smiles ",style: GoogleFonts.dancingScript(textStyle: TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold,color: Colors.green[700]
                  )),),

                ],
              ),
            ),



      ),
    );
  }
}

