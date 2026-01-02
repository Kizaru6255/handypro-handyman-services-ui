import 'auth_api.dart';
import 'models/auth_response.dart';
import 'models/user_model.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/constants/app_config.dart';

/// Auth repository with session persistence
class AuthRepository {
  AuthRepository(this._api, this._storageService);

  final AuthApi _api;
  final StorageService _storageService;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.login(email: email, password: password);
    await _saveSession(response);
    return response;
  }

  Future<AuthResponse> loginWithPhone({
    required String phoneNumber,
    required String otp,
  }) async {
    final response = await _api.loginWithPhone(phoneNumber: phoneNumber, otp: otp);
    await _saveSession(response);
    return response;
  }

  Future<void> sendOtp(String phoneNumber) async {
    return _api.sendOtp(phoneNumber);
  }

  Future<void> logout() async {
    await _api.logout();
    await _clearSession();
  }

  Future<void> forgotPassword({required String email}) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<UserModel?> getCurrentUser() async {
    final token = await _storageService.getString(AppConfig.keyAuthToken);
    if (token == null) return null;
    
    final userId = await _storageService.getString(AppConfig.keyUserId);
    if (userId == null) return null;

    // In real app, fetch from API
    return UserModel(
      id: userId,
      fullName: await _storageService.getString('user_name') ?? 'User',
      email: await _storageService.getString('user_email') ?? '',
      phoneNumber: await _storageService.getString('user_phone') ?? '',
      avatarUrl: await _storageService.getString('user_avatar'),
    );
  }

  Future<bool> isLoggedIn() async {
    final token = await _storageService.getString(AppConfig.keyAuthToken);
    return token != null;
  }

  Future<void> _saveSession(AuthResponse response) async {
    await _storageService.setString(AppConfig.keyAuthToken, response.token);
    await _storageService.setString(AppConfig.keyRefreshToken, response.refreshToken);
    await _storageService.setString(AppConfig.keyUserId, response.user.id);
    await _storageService.setString('user_name', response.user.fullName);
    await _storageService.setString('user_email', response.user.email);
    await _storageService.setString('user_phone', response.user.phoneNumber);
    if (response.user.avatarUrl != null) {
      await _storageService.setString('user_avatar', response.user.avatarUrl!);
    }
  }

  Future<void> _clearSession() async {
    await _storageService.remove(AppConfig.keyAuthToken);
    await _storageService.remove(AppConfig.keyRefreshToken);
    await _storageService.remove(AppConfig.keyUserId);
    await _storageService.remove('user_name');
    await _storageService.remove('user_email');
    await _storageService.remove('user_phone');
    await _storageService.remove('user_avatar');
  }
}

