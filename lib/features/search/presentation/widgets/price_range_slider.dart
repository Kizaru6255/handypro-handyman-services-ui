import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

/// Price range slider widget
class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
  });

  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: values,
      min: 0,
      max: 1000,
      divisions: 50,
      activeColor: AppColors.primaryBlue,
      onChanged: onChanged,
    );
  }
}


