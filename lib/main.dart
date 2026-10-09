import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const BloodCareApp());
}

class BloodCareApp extends StatelessWidget {
  const BloodCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}
