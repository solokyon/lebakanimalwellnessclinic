import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lebakanimalwellnessclinic/core/theme/app_colors.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({
    required this.emailController,
    required this.passwordController,
    required this.login,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback login;

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final List<String> images = [
    'assets/scroll_view/caro1.png',
    'assets/scroll_view/caro2.png',
    'assets/scroll_view/caro3.png',
  ];
  int _currentIndex = 0;
  late Timer _logintimer;

  @override
  void initState() {
    super.initState();
    _logintimer = Timer.periodic(const Duration(seconds: 8), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });  
  }

  @override
  void dispose() {
    _logintimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/horizontal_text_logo.png', width: 200),
                ],
              ),

              const SizedBox(height: 8),

              Container(
                width: 52,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              SizedBox(height: 14),

              Text(
                'Welcome to Lebak AWC App',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                ' Sign in to continue to the clinic system',
                style: Theme.of(context).textTheme.labelSmall,
                
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      images[_currentIndex],
                      key: ValueKey<int>(_currentIndex),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Address"),

                        TextField(
                          controller: widget.emailController,
                          decoration: InputDecoration(
                            hintText: 'staff@lebakawc.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),

                        Text("Password"),

                        TextField(
                          controller: widget.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?"),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text("FOR AUTHORIZED STAFF ONLY"),
                              ElevatedButton(
                                onPressed: widget.login,
                                child: Text('Login'),
                              ),
                            ],
                          ),
                        ),

                        
                      ],
                    ),
                  ),
                ),
              ),

              Text("© 2024 Laplace Labs")
            ],
          ),
        ),
      ),
    );
  }
}
