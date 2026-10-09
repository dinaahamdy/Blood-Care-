import 'package:flutter/material.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    imagePath: 'assets/images/donate_blood.png',
    title: 'Donate Blood',
    description: 'sed quia non numquam eius modi tempora labore et dolore magnam aliquam.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/save_lifes.png',
    title: 'Save Lifes',
    description: 'sed quia non numquam eius modi tempora labore et dolore magnam aliquam.',
  ),
  OnboardingModel(
    imagePath: 'assets/images/connect_community.png',
    title: 'Get Connect Community',
    description: 'sed quia non numquam eius modi tempora labore et dolore magnam aliquam.',
  ),
];
