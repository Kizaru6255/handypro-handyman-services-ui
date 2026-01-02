import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_service_card.dart';
import '../../data/models/service_model.dart';

/// Home service list widget
class HomeServiceList extends StatelessWidget {
  const HomeServiceList({
    super.key,
    required this.services,
    this.onServiceTap,
  });

  final List<ServiceModel> services;
  final ValueChanged<ServiceModel>? onServiceTap;

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return Center(
        child: Text('empty_states.no_data'.tr()),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return AppServiceCard(
          title: service.title,
          imageUrl: service.imageUrl,
          location: service.location,
          description: service.description,
          rating: service.rating,
          reviewCount: service.reviewCount,
          priceMin: service.priceMin,
          priceMax: service.priceMax,
          isRecommended: service.isRecommended ?? false,
          onTap: () => onServiceTap?.call(service),
        );
      },
    );
  }
}


