import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';

class Auth extends StatefulWidget{
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() => _Auth();
}

class _Auth extends State<Auth>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var error = '';

  Future<void> login () async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim()
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
         error = 'Login failed: ${e.message}';
      });
      
    }
  }
  Future<void> register () async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
         error = 'Login failed: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('Sign up',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            Text('Email',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter email'
              ),
            ),
            SizedBox(height: 10,),
            Text('Password',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password'
              ),
              obscureText: true,
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: (){
                login();
              },
              child: Text('Sign in'),
            ),
            TextButton(
              onPressed: (){
                register();
              }, 
              child: Text('Create Account')
            ),
          ],
        ),
      ),
    );
  }

}