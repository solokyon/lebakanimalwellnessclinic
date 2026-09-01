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
    'assets/scroll_view/1w.png',
    'assets/scroll_view/2w.jpg',
    'assets/scroll_view/3w.jpg',
    'assets/scroll_view/4w.jpg',
    'assets/scroll_view/5w.jpg',
    'assets/scroll_view/6w.jpg',
    'assets/scroll_view/7w.jpg',
  ];
  int _currentIndex = 0;
  late Timer _logintimer;

  @override
  void initState() {
    _logintimer = Timer.periodic(const Duration(seconds: 8), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
    super.initState();
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
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/horizontal_text_logo.png', width: 200),
                ],
              ),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Text(
                'Welcome to Lebak AWC App',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Sign in to your staff account',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                child: Image.asset(
                  images[_currentIndex],
                  key: ValueKey<int>(_currentIndex),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
