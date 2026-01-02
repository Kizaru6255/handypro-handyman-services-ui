import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../coupon/presentation/widgets/apply_coupon_sheet.dart';
import '../../../payment/presentation/widgets/price_breakdown.dart';
import '../../../payment/presentation/screens/payment_methods_screen.dart';
import '../widgets/date_time_picker.dart';

/// Enhanced Checkout screen
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  DateTime? _selectedDateTime;
  String? _selectedPaymentMethod;
  String? _appliedCoupon;
  double _discount = 0.0;
  
  final double _basePrice = 100.0;
  final double _serviceFee = 3.55;
  final double _taxes = 5.0;

  void _selectDateTime() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DateTimePicker(
        onDateTimeSelected: (dateTime) {
          setState(() {
            _selectedDateTime = dateTime;
          });
        },
      ),
    );
  }

  void _applyCoupon() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ApplyCouponSheet(
        onApply: (couponCode) {
          setState(() {
            _appliedCoupon = couponCode;
            _discount = 10.0; // Mock discount
          });
        },
      ),
    );
  }

  void _selectPaymentMethod() async {
    final method = await context.push<String>('/payment-methods');
    if (method != null) {
      setState(() {
        _selectedPaymentMethod = method;
      });
    }
  }

  void _proceedToPayment() {
    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select date and time'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select payment method'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Navigate to payment processing
    context.push('/payment/process');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = _basePrice + _serviceFee + _taxes - _discount;

    return Scaffold(
      appBar: AppBar(
        title: Text('payment.booking_summary'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Details',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Card(
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: const Icon(Icons.cleaning_services),
                ),
                title: Text('House Cleaning Service'),
                subtitle: Text('Basic Package - 1 Person'),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Date & Time',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppSecondaryButton(
              label: _selectedDateTime != null
                  ? '${_selectedDateTime!.toString().split(' ')[0]} at ${_selectedDateTime!.toString().split(' ')[1].substring(0, 5)}'
                  : 'Select Date & Time',
              onPressed: _selectDateTime,
              icon: Icon(Icons.calendar_today),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Coupon',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppSecondaryButton(
              label: _appliedCoupon != null
                  ? 'Coupon: $_appliedCoupon'
                  : 'Apply Coupon',
              onPressed: _applyCoupon,
              icon: Icon(Icons.local_offer),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Payment Method',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppSecondaryButton(
              label: _selectedPaymentMethod ?? 'Select Payment Method',
              onPressed: _selectPaymentMethod,
              icon: Icon(Icons.payment),
            ),
            const SizedBox(height: AppSpacing.xl),
            PriceBreakdown(
              basePrice: _basePrice,
              serviceFee: _serviceFee,
              taxes: _taxes,
              discount: _discount,
              couponCode: _appliedCoupon,
            ),
            const SizedBox(height: AppSpacing.xl),
            AppPrimaryButton(
              label: 'Pay \$${total.toStringAsFixed(2)}',
              onPressed: _proceedToPayment,
            ),
          ],
        ),
      ),
    );
  }
}


