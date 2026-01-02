import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// Shimmer loading widget
class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),
    );
  }
}

/// Service card shimmer
class ServiceCardShimmer extends StatelessWidget {
  const ServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppShimmer(width: double.infinity, height: 150),
            const SizedBox(height: AppSpacing.md),
            const AppShimmer(width: 200, height: 20),
            const SizedBox(height: AppSpacing.sm),
            const AppShimmer(width: 150, height: 16),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                const AppShimmer(width: 80, height: 16),
                const Spacer(),
                const AppShimmer(width: 60, height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
