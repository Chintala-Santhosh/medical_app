import 'package:flutter/material.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    splashTimer();

    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(child: Text("Welcome to Medical App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
      ),
    );
  }

  splashTimer(){
    Future.delayed(const Duration(microseconds: 1),(){
      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>const MainScreen()));

    });;
    setState(() {

    });
  }
}


