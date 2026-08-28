import 'package:flutter/material.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({
    required this.emailController,
    required this.passwordController,
    required this.login,
    super.key
    });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback login;

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/login_logo.png'),
              SizedBox(height: 16.0),
              TextField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: widget.passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: widget.login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}