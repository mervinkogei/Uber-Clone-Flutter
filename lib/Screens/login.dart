import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

TextEditingController  email = TextEditingController();
TextEditingController  password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:  [
          const SizedBox(height: 45,),
          const Image(image: AssetImage('images/logo.png'), width: 350,height: 250, alignment: Alignment.center,),
          const SizedBox(height: 1,),
          const Text("Login as Rider", style: TextStyle(fontSize: 24, fontFamily: 'Brand Bolt', ),textAlign: TextAlign.center,),
          Padding(padding: const EdgeInsets.all(20),
          child: Column(
            children:  [
          const SizedBox(height: 1,),
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 14),
              hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
            ),
          ),
          const SizedBox(height: 1,),
          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(fontSize: 14),
              hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
            ),
          ),
          const SizedBox(height: 15,),
          SizedBox(child: InkWell(
            onTap: (){},
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                border: Border.all(width: 2, color: Colors.yellow),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),             
              height: 50,
              width: double.infinity,
              child: const Center(child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white),)),
            ),
          ))
            ],
          ),),
          TextButton(onPressed: (){
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegisterScreen()));
            Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
          }, child: const Text("Don't have an account? Register Here", style: TextStyle(color: Colors.black),))
        ],
      )
      
    );
  }
}