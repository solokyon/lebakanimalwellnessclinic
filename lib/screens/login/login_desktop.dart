import 'package:flutter/material.dart';

class LoginDesktop extends StatefulWidget {
  const new({
    required this.emailController,
    required this.passwordController,
    required this.login,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback login;

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/login_logo.png'
                )
              ),
            ),

            Expanded(
              child: Column(
                children: [
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

                  ElevatedButton(onPressed: widget.login, child: Text('Login')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
