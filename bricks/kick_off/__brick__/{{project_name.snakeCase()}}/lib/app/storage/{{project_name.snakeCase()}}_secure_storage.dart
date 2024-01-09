import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/storage_constants.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorage {
  Future<void> storeAccessToken(String token);
  Future<String> getAccessToken();

  Future<void> storeUserId(String userId);
  Future<String> getUserId();
}

@Singleton(as: SecureStorage)
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl(this._storage);

  @override
  Future<void> storeAccessToken(String token) async {
    await _storage.write(key: SecureStorageConstants.accessToken, value: token);
  }

  @override
  Future<String> getAccessToken() async {
    return await _storage.read(key: SecureStorageConstants.accessToken) ?? '';
  }

  @override
  Future<void> storeUserId(String userId) async {
    await _storage.write(key: SecureStorageConstants.userId, value: userId);
  }

  @override
  Future<String> getUserId() async {
    return await _storage.read(key: SecureStorageConstants.userId) ?? '';
  }
}
