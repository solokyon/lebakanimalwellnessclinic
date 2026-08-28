import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lebakanimalwellnessclinic/screens/login/login_desktop.dart';
import 'package:lebakanimalwellnessclinic/screens/login/login_mobile.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login()async{
    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if(credential.user != null){
        context.go('/admin');
      }
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return LoginMobile(
              emailController: emailController,
              passwordController: passwordController,
              login: login,
            );
          } else {
            return LoginDesktop(
              emailController: emailController,
              passwordController: passwordController,
              login: login,
            );
          }
        },
      ),
    );
  }
}

