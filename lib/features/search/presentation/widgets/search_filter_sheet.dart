import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import 'price_range_slider.dart';

/// Search filter bottom sheet
class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({
    super.key,
    this.onApply,
    this.onClear,
  });

  final VoidCallback? onApply;
  final VoidCallback? onClear;

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  RangeValues _priceRange = const RangeValues(0, 1000);
  double _minRating = 0.0;
  double _maxDistance = 50.0;
  final Set<String> _selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Price Range',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          PriceRangeSlider(
            values: _priceRange,
            onChanged: (values) {
              setState(() {
                _priceRange = values;
              });
            },
          ),
          Text(
            '\$${_priceRange.start.round()} - \$${_priceRange.end.round()}',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Minimum Rating',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Slider(
            value: _minRating,
            min: 0,
            max: 5,
            divisions: 10,
            label: _minRating.toStringAsFixed(1),
            onChanged: (value) {
              setState(() {
                _minRating = value;
              });
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Maximum Distance',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Slider(
            value: _maxDistance,
            min: 0,
            max: 100,
            divisions: 20,
            label: '${_maxDistance.round()} km',
            onChanged: (value) {
              setState(() {
                _maxDistance = value;
              });
            },
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Categories',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Cleaning', 'Repairing', 'Painting', 'Cooking'].map((cat) {
              final isSelected = _selectedCategories.contains(cat);
              return FilterChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCategories.add(cat);
                    } else {
                      _selectedCategories.remove(cat);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: AppSecondaryButton(
                  label: 'Clear All',
                  onPressed: () {
                    setState(() {
                      _priceRange = const RangeValues(0, 1000);
                      _minRating = 0.0;
                      _maxDistance = 50.0;
                      _selectedCategories.clear();
                    });
                    widget.onClear?.call();
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppPrimaryButton(
                  label: 'Apply Filters',
                  onPressed: () {
                    widget.onApply?.call();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


