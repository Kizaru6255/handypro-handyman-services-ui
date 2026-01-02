import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../providers/auth_controller.dart';

/// Phone OTP screen
class PhoneOtpScreen extends ConsumerStatefulWidget {
  const PhoneOtpScreen({super.key});

  @override
  ConsumerState<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends ConsumerState<PhoneOtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  Future<void> _verifyOtp() async {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter 6-digit OTP'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final controller = ref.read(authControllerProvider.notifier);
    await controller.loginWithPhone(
      phoneNumber: '+1 (409) 487-1935', // Get from route extra
      otp: otp,
    );
  }

  void _handleAuthState(AsyncValue<dynamic> state) {
    state.when(
      data: (response) {
        if (response != null && mounted) {
          context.go('/home/main');
        }
      },
      loading: () {
        // Loading state is handled by the button
      },
      error: (error, stackTrace) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Verification failed: ${error.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    
    // Handle auth state changes
    ref.listen<AsyncValue<dynamic>>(
      authControllerProvider,
      (previous, next) {
        _handleAuthState(next);
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'auth.enter_otp'.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${'auth.otp_sent'.tr()} +1 (409) 487-1935',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 48,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) => _onChanged(index, value),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'auth.verify'.tr(),
              onPressed: authState.isLoading ? null : _verifyOtp,
              isLoading: authState.isLoading,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text('auth.resend_otp'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

