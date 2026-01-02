import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Coupons list screen
class CouponsListScreen extends StatelessWidget {
  const CouponsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('coupon.title'.tr()),
      ),
      body: Center(
        child: Text('coupon.title'.tr()),
      ),
    );
  }
}


