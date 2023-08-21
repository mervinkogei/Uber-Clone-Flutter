import 'package:flutter/material.dart';
import 'package:uberclone/Screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Rider App',
      debugShowCheckedModeBanner: false,      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand Bolt'
      ),
      home: LoginScreen(),
    );
  }
}

