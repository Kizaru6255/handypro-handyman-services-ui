import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// Premium search bar widget
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onFilterTap,
    this.showFilter = true,
  });

  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;
  final bool showFilter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hint ?? 'Search...',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textTertiary,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
          suffixIcon: showFilter
              ? IconButton(
                  icon: const Icon(Icons.tune, color: AppColors.textTertiary),
                  onPressed: onFilterTap,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
        ),
      ),
    );
  }
}


