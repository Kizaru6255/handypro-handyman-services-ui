import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/widgets/phone_input_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../providers/auth_controller.dart';

/// Enhanced Login/Sign Up Screen
class EnhancedLoginScreen extends ConsumerStatefulWidget {
  const EnhancedLoginScreen({super.key});

  @override
  ConsumerState<EnhancedLoginScreen> createState() => _EnhancedLoginScreenState();
}

class _EnhancedLoginScreenState extends ConsumerState<EnhancedLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isSignUp = true;
  bool _isPhoneLogin = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = ref.read(authControllerProvider.notifier);
    
    if (_isSignUp) {
      if (_isPhoneLogin) {
        context.push('/phone-otp', extra: _phoneController.text);
      } else {
        await controller.login(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) {
          final state = ref.read(authControllerProvider);
          state.whenData((response) {
            if (response != null) {
              context.go('/addresses/add'); // Redirect to add address after signup
            }
          });
        }
      }
    } else {
      await controller.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (mounted) {
        final state = ref.read(authControllerProvider);
        state.whenData((response) {
          if (response != null) {
            context.go('/home/main');
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isSignUp ? 'auth.create_account'.tr() : 'auth.login'.tr(),
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                _isSignUp
                    ? 'Create your account to get started'
                    : 'Welcome back! Please login to continue',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              if (_isSignUp && !_isPhoneLogin) ...[
                AppInputField(
                  label: 'auth.full_name'.tr(),
                  controller: _nameController,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Required' : null,
                ),
                const SizedBox(height: AppSpacing.md),
              ],
              if (_isPhoneLogin)
                PhoneInputField(
                  label: 'auth.phone_number'.tr(),
                  controller: _phoneController,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Required' : null,
                )
              else
                AppInputField(
                  label: 'auth.email'.tr(),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (!value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: AppSpacing.md),
              if (!_isPhoneLogin) ...[
                AppInputField(
                  label: 'auth.password'.tr(),
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    if (_isSignUp && value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                if (_isSignUp) ...[
                  const SizedBox(height: AppSpacing.md),
                  AppInputField(
                    label: 'auth.confirm_password'.tr(),
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ],
              ],
              if (!_isSignUp) ...[
                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.push('/forgot-password'),
                    child: Text('auth.forgot_password'.tr()),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: _isSignUp
                    ? (_isPhoneLogin ? 'Continue' : 'auth.sign_up'.tr())
                    : 'auth.login'.tr(),
                onPressed: authState.isLoading ? null : _handleSubmit,
                isLoading: authState.isLoading,
              ),
              const SizedBox(height: AppSpacing.md),
              if (_isSignUp)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Or continue with'),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isPhoneLogin = !_isPhoneLogin;
                        });
                      },
                      child: Text(_isPhoneLogin ? 'Email' : 'Phone'),
                    ),
                  ],
                ),
              const SizedBox(height: AppSpacing.lg),
              Center(
                child: Text(
                  'auth.terms_conditions'.tr(),
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isSignUp
                        ? 'auth.already_have_account'.tr()
                        : "Don't have an account? ",
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignUp = !_isSignUp;
                        _isPhoneLogin = false;
                      });
                    },
                    child: Text(_isSignUp ? 'auth.sign_in'.tr() : 'auth.sign_up'.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


