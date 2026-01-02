import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/network_image_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/banner_model.dart';

/// Special offer banner widget
class SpecialOfferBanner extends StatelessWidget {
  const SpecialOfferBanner({
    super.key,
    required this.banner,
    this.onTap,
  });

  final BannerModel banner;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner.title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      banner.description ?? 'home.discount_text'.tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 150,
                      child: AppButton(
                        label: 'home.get_discount'.tr(),
                        onPressed: onTap,
                        isFullWidth: false,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              NetworkImageWidget(
                imageUrl: banner.imageUrl,
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


