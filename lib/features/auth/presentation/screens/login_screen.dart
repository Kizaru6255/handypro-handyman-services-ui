import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/auth_controller.dart';

/// Login screen
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'aaronramsdale@gmail.com');
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController(text: '+1 (409) 487-1935');
  final _nameController = TextEditingController(text: 'Aaron Ramsdale');
  bool _isPhoneLogin = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final controller = ref.read(authControllerProvider.notifier);
    if (_isPhoneLogin) {
      // Navigate to OTP screen
      context.go('/phone-otp', extra: _phoneController.text);
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

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'auth.create_account'.tr(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              if (!_isPhoneLogin) ...[
                AppTextField(
                  label: 'auth.full_name'.tr(),
                  controller: _nameController,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'auth.phone_number'.tr(),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.flag),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'auth.email'.tr(),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'auth.password'.tr(),
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ] else ...[
                AppTextField(
                  label: 'auth.phone_number'.tr(),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.flag),
                ),
              ],
              const SizedBox(height: 24),
              AppButton(
                label: _isPhoneLogin ? 'auth.verify'.tr() : 'auth.sign_up'.tr(),
                onPressed: authState.isLoading ? null : _handleLogin,
                isLoading: authState.isLoading,
              ),
              const SizedBox(height: 16),
              Text(
                'auth.terms_conditions'.tr(),
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('auth.already_have_account'.tr()),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isPhoneLogin = !_isPhoneLogin;
                      });
                    },
                    child: Text('auth.sign_in'.tr()),
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

