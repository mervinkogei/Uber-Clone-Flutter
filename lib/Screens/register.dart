import 'package:flutter/material.dart';
import 'package:uberclone/Screens/login.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Text"),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
              SizedBox(height: 45,),
              Image(image: AssetImage('images/logo.png'), width: 350,height: 250, alignment: Alignment.center,),
              SizedBox(height: 1,),
              Text("Register as a Rider", style: TextStyle(fontSize: 24, fontFamily: 'Brand Bolt', ),textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.all(20),
              child: Column(
                children:  [
                  SizedBox(height: 1,),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
                ),
              ),
              SizedBox(height: 1,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
                ),
              ),
              SizedBox(height: 1,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
                ),
              ),
              SizedBox(height: 1,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 10, color: Colors.grey)
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(child: InkWell(
                onTap: (){print("Logged in Button cliked");},
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    border: Border.all(width: 2, color: Colors.yellow),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),             
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text("Create Account", style: TextStyle(fontSize: 18, color: Colors.white),)),
                ),
              ))
                ],
              ),),
              TextButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
              }, child: const Text("Already have an account? Login Here", style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      )
      
    );
  }
}