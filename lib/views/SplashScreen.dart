import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/views/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splashscreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo-color.png'),
            radius: 100,
          ),
        )
      ],
    ));
  }
}
