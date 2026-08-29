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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
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
            ],
          ),
        ),
      ),
    );
  }
}
