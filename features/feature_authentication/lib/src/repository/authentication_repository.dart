import 'package:edu_services/edu_services.dart';

class AuthenticationRepository {
  final SecureStorageService _secureStorageService;

  String? get token => _token;

  String? _token;

  AuthenticationRepository._(this._secureStorageService, this._token);

  static Future<AuthenticationRepository> create(SecureStorageService secureStorageService) async {
    final token = await secureStorageService.getString(StorageKey.token);
    return AuthenticationRepository._(
      secureStorageService,
      token,
    );
  }

  Future<void> setToken(String? token) async {
    _token = token;
    await _secureStorageService.setString(StorageKey.token, token);
  }
}