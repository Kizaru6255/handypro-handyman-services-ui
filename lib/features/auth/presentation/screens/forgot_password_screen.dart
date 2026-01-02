import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/widgets/phone_input_field.dart';
import '../providers/auth_controller.dart';

/// Forgot Password Screen
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isPhoneMethod = false;
  bool _otpSent = false;
  bool _showPasswordFields = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final controller = ref.read(authControllerProvider.notifier);
      if (_isPhoneMethod) {
        await controller.sendOtp(_phoneController.text);
      } else {
        await controller.forgotPassword(email: _emailController.text);
      }
      setState(() {
        _otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('OTP sent successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send OTP: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _verifyAndReset() async {
    if (!_formKey.currentState!.validate()) return;

    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final controller = ref.read(authControllerProvider.notifier);
      await controller.resetPassword(
        email: _isPhoneMethod ? _phoneController.text : _emailController.text,
        otp: _otpController.text,
        newPassword: _newPasswordController.text,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password reset successfully'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/login');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to reset password: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('auth.forgot_password'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'auth.forgot_password'.tr(),
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your ${_isPhoneMethod ? 'phone number' : 'email'} to receive OTP',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Text('Email'),
                      selected: !_isPhoneMethod,
                      onSelected: (selected) {
                        setState(() {
                          _isPhoneMethod = false;
                          _otpSent = false;
                          _showPasswordFields = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ChoiceChip(
                      label: Text('Phone'),
                      selected: _isPhoneMethod,
                      onSelected: (selected) {
                        setState(() {
                          _isPhoneMethod = true;
                          _otpSent = false;
                          _showPasswordFields = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (!_isPhoneMethod)
                AppInputField(
                  label: 'auth.email'.tr(),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                )
              else
                PhoneInputField(
                  label: 'auth.phone_number'.tr(),
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
              if (_otpSent) ...[
                const SizedBox(height: 24),
                AppInputField(
                  label: 'auth.enter_otp'.tr(),
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'OTP is required';
                    }
                    if (value.length != 6) {
                      return 'OTP must be 6 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppPrimaryButton(
                  label: 'Verify OTP',
                  onPressed: () {
                    setState(() {
                      _showPasswordFields = true;
                    });
                  },
                ),
              ],
              if (_showPasswordFields) ...[
                const SizedBox(height: 24),
                AppInputField(
                  label: 'New Password',
                  controller: _newPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppInputField(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                AppPrimaryButton(
                  label: 'Reset Password',
                  onPressed: _verifyAndReset,
                ),
              ] else if (!_otpSent) ...[
                const SizedBox(height: 24),
                AppPrimaryButton(
                  label: 'Send OTP',
                  onPressed: _sendOtp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}


