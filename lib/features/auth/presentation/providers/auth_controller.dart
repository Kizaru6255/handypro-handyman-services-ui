import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/auth_api.dart';
import '../../data/auth_repository.dart';
import '../../data/models/auth_response.dart';
import '../../data/models/user_model.dart';
import '../../../../core/services/dio_client.dart';
import '../../../../core/services/storage_service.dart';

/// Auth API provider
final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return AuthApi(dio);
});

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiProvider);
  final storage = ref.watch(storageServiceProvider);
  return AuthRepository(api, storage);
});

/// Current user provider
final currentUserProvider = FutureProvider<UserModel?>((ref) async {
  final repository = ref.watch(authRepositoryProvider);
  return repository.getCurrentUser();
});

/// Auth controller
class AuthController extends StateNotifier<AsyncValue<AuthResponse?>> {
  AuthController(this._repository, this.ref) : super(const AsyncValue.data(null));

  final AuthRepository _repository;
  final Ref ref;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.login(
        email: email,
        password: password,
      );
      state = AsyncValue.data(response);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> loginWithPhone({
    required String phoneNumber,
    required String otp,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _repository.loginWithPhone(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      state = AsyncValue.data(response);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      await _repository.sendOtp(phoneNumber);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
      state = const AsyncValue.data(null);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _repository.forgotPassword(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      await _repository.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> checkAuthStatus(WidgetRef ref) async {
    final isLoggedIn = await _repository.isLoggedIn();
    if (isLoggedIn) {
      final user = await _repository.getCurrentUser();
      if (user != null) {
        // User is logged in, refresh current user
        ref.invalidate(currentUserProvider);
      }
    }
  }
}

/// Auth controller provider
final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthResponse?>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository, ref);
});

