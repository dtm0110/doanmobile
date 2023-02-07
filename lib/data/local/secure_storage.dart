import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_search/extension/operation_extension.dart';

abstract class SecureStorage {
  Future<String?> readValue({required String key});

  Future<bool> writeValue({required String key, required dynamic value});

  Future<void> deleteByKey({required String key});

  Future<void> removeAll();
}

class SecureStorageImpl extends SecureStorage {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions.defaultOptions,
    iOptions: IOSOptions.defaultOptions,
  );

  @override
  Future<void> deleteByKey({required String key}) {
    return tryBlock(() => _storage.delete(key: key));
  }

  @override
  Future<String?> readValue({required String key}) {
    return tryBlock(() => _storage.read(key: key));
  }

  @override
  Future<void> removeAll() {
    return tryBlock(() => _storage.deleteAll());
  }

  @override
  Future<bool> writeValue({required String key, required value}) async {
    try {
      await _storage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
