import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uberclone/Screens/home.dart';
import 'package:uberclone/Screens/login.dart';
import 'package:uberclone/Screens/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

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
      home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        '/home':(context) => HomeScreen(),
        '/register':(context) => const RegisterScreen(),
        '/login':(context) => const LoginScreen()
      },
    );
  }
}

