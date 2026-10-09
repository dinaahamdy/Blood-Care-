import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class SetupHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBack;
  final VoidCallback? onSkip;

  const SetupHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBack,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onBack ?? () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: AppColors.darkText,
              ),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            TextButton(
              onPressed: onSkip, // ← اتغير من () {} لـ onSkip
              child: const Text(
                'Skip',
                style: TextStyle(color: AppColors.darkText, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.greyText,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
