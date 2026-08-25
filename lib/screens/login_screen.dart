import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  

  void login()async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Invalid email or user not found.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }else if (e.code == 'invalid-email') {
        print('Invalid email format.');
      } else {
        print('Authentication Failed: ${e.message}');
      }
    }catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/login_logo.png',),
            
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
            
                    SizedBox(height: 16.0),
            
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                
            
                SizedBox(height: 16.0),
            
                ElevatedButton(onPressed: login, child: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
