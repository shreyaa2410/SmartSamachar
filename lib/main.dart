import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const HelloFlutterApp());
}

class HelloFlutterApp extends StatefulWidget {
  const HelloFlutterApp({super.key});

  @override
  State<HelloFlutterApp> createState() => _HelloFlutterAppState();
}

class _HelloFlutterAppState extends State<HelloFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

// d449a29289a3483a8d92b052a9453fb7
