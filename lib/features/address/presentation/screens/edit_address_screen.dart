import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/widgets/phone_input_field.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/address_model.dart';
import '../providers/address_controller.dart';
import 'add_address_screen.dart';

/// Edit Address Screen
class EditAddressScreen extends ConsumerStatefulWidget {
  const EditAddressScreen({
    super.key,
    required this.addressId,
  });

  final String addressId;

  @override
  ConsumerState<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends ConsumerState<EditAddressScreen> {
  // Similar to AddAddressScreen but pre-filled
  // Implementation similar to AddAddressScreen
  // Load address data and populate fields

  @override
  Widget build(BuildContext context) {
    // For now, redirect to add screen
    // In production, load address and edit
    return const AddAddressScreen();
  }
}


