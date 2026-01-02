import 'package:dio/dio.dart';
import 'models/auth_response.dart';
import 'models/user_model.dart';

/// Auth API for authentication endpoints
class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    // Mock implementation - replace with actual API call
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(
      token: 'mock_token',
      refreshToken: 'mock_refresh_token',
      user: UserModel(
        id: '1',
        fullName: 'Aaron Ramsdale',
        email: email,
        phoneNumber: '+1 (409) 487-1935',
        avatarUrl: null,
      ),
    );
  }

  Future<AuthResponse> loginWithPhone({
    required String phoneNumber,
    required String otp,
  }) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse(
      token: 'mock_token',
      refreshToken: 'mock_refresh_token',
      user: UserModel(
        id: '1',
        fullName: 'Aaron Ramsdale',
        email: 'aaronramsdale@gmail.com',
        phoneNumber: phoneNumber,
        avatarUrl: null,
      ),
    );
  }

  Future<void> sendOtp(String phoneNumber) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> logout() async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 300));
  }
}


