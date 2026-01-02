import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Add review screen
class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({
    super.key,
    required this.bookingId,
  });

  final String bookingId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  double _rating = 0.0;
  final _reviewController = TextEditingController();
  final List<String> _selectedTags = [];

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tags = ['Professional', 'Punctual', 'Clean', 'Friendly', 'Efficient'];

    return Scaffold(
      appBar: AppBar(
        title: Text('review.add_review'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'review.rate_service'.tr(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle tap to set rating
                },
                child: RatingStars(
                  rating: _rating,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'review.add_tags'.tr(),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                final isSelected = _selectedTags.contains(tag);
                return FilterChip(
                  label: Text(tag),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedTags.add(tag);
                      } else {
                        _selectedTags.remove(tag);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.xl),
            AppInputField(
              label: 'review.write_review'.tr(),
              controller: _reviewController,
              maxLines: 5,
              hint: 'Share your experience...',
            ),
            const SizedBox(height: AppSpacing.xl),
            AppPrimaryButton(
              label: 'review.submit'.tr(),
              onPressed: _rating > 0
                  ? () {
                      // Submit review
                      Navigator.pop(context);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
