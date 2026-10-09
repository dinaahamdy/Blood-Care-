import 'dart:async';

import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بعد ثانيتين وربع ننقل لشاشة الـ Onboarding
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // دايرة اللوجو
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.softRed,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.water_drop,
                  color: AppColors.primaryRed,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // اسم التطبيق
            const Text(
              'Blood Care',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
