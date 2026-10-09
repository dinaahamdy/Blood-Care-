import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/setup_header.dart';
import 'basic_info_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  String? _bloodGroup;
  String? _country;
  String? _city;

  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  final List<String> _countries = [
    'Egypt',
    'Bangladesh',
    'Saudi Arabia',
    'UAE',
  ];
  final List<String> _cities = ['Cairo', 'Dhaka', 'Riyadh', 'Dubai'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetupHeader(
                title: 'Profile Setup',
                subtitle: '...',
                onSkip: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BasicInfoScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),

              // أيقونة الشخص
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: AppColors.softRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: AppColors.primaryRed,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Center(
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // الاسم
              const _Label('Your Name'),
              CustomTextField(hint: 'User name', controller: _nameController),
              const SizedBox(height: 20),

              // الموبايل
              const _Label('Mobile Number'),
              CustomTextField(
                hint: 'User name',
                controller: _mobileController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // فصيلة الدم
              const _Label('Select Group'),
              _DropdownField(
                hint: 'Blood group',
                value: _bloodGroup,
                items: _bloodGroups,
                onChanged: (val) => setState(() => _bloodGroup = val),
              ),
              const SizedBox(height: 20),

              // الدولة
              const _Label('Country'),
              _DropdownField(
                hint: 'Select country',
                value: _country,
                items: _countries,
                onChanged: (val) => setState(() => _country = val),
              ),
              const SizedBox(height: 20),

              // المدينة
              const _Label('City'),
              _DropdownField(
                hint: 'Select city',
                value: _city,
                items: _cities,
                onChanged: (val) => setState(() => _city = val),
              ),
              const SizedBox(height: 30),

              // زرار Next
              PrimaryButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BasicInfoScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// widget صغير للـ Label
class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
        ),
      ),
    );
  }
}

// widget صغير للـ Dropdown
class _DropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const _DropdownField({
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: AppColors.greyText, fontSize: 14),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.greyText,
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(color: AppColors.darkText),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
