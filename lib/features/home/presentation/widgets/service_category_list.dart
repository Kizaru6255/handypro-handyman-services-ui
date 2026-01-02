import 'package:flutter/material.dart';
import '../../../../core/widgets/app_category_chip.dart';
import '../../data/models/category_model.dart';

/// Service category list widget
class ServiceCategoryList extends StatelessWidget {
  const ServiceCategoryList({
    super.key,
    required this.categories,
    this.onCategoryTap,
  });

  final List<CategoryModel> categories;
  final ValueChanged<CategoryModel>? onCategoryTap;

  IconData _getIcon(String iconName) {
    switch (iconName.toLowerCase()) {
      case 'cleaning':
        return Icons.cleaning_services;
      case 'cooking':
        return Icons.restaurant;
      case 'shipping':
        return Icons.local_shipping;
      case 'repairing':
        return Icons.build;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AppCategoryChip(
              label: category.name,
              icon: _getIcon(category.icon),
              onTap: () => onCategoryTap?.call(category),
            ),
          );
        },
      ),
    );
  }
}


