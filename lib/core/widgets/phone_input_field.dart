import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// Phone input field with country picker
class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.hint,
  });

  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: hint ?? 'Enter phone number',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: TextButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (country) {
                      // Handle country selection
                    },
                  );
                },
                child: const Text('+1'),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: BorderSide(
                color: AppColors.primaryBlue,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: isDark ? Colors.grey[900] : Colors.grey[50],
          ),
        ),
      ],
    );
  }
}
