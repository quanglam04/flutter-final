import 'dart:convert';

import 'package:flutter_clean_architecture/shared/extension/object.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LocalStorageKeys {
  username,
  password,
}

abstract class LocalStorageManager {
  Future<bool> keyExists(LocalStorageKeys key, {bool isSecure = false});

  Future<T?> getValue<T>(
    LocalStorageKeys key, {
    T Function(Map<String, dynamic>)? fromJson,
    bool isSecure = false,
  });

  void setValue<T>(LocalStorageKeys key, T value, {bool isSecure = false});

  void deleteKey(LocalStorageKeys key, {bool isSecure = false});
}

@Singleton(as: LocalStorageManager)
class LocalStorageManagerImpl extends LocalStorageManager {
  LocalStorageManagerImpl(this._prefs, this._secureStorage);

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  @override
  Future<bool> keyExists(LocalStorageKeys key, {bool isSecure = false}) async {
    if (isSecure) {
      return await _secureStorage.containsKey(
        key: key.name,
        aOptions: _getAndroidOptions(),
      );
    } else {
      return _prefs.containsKey(key.name);
    }
  }

  @override
  Future<T?> getValue<T>(
    LocalStorageKeys key, {
    T Function(Map<String, dynamic>)? fromJson,
    bool isSecure = false,
  }) async {
    if (isSecure) {
      return (await _secureStorage.read(
        key: key.name,
        aOptions: _getAndroidOptions(),
      ))?.asOrNull<T?>();
    } else {
      switch (T) {
        case int:
          return _prefs.getInt(key.name) as T?;
        case double:
          return _prefs.getDouble(key.name) as T?;
        case String:
          return _prefs.getString(key.name) as T?;
        case bool:
          return _prefs.getBool(key.name) as T?;
        default:
          assert(
            fromJson != null,
            'fromJson must be provided for Object values',
          );
          if (fromJson != null) {
            final stringObject = _prefs.getString(key.name);
            if (stringObject == null) {
              return null;
            }
            final jsonObject = jsonDecode(stringObject) as Map<String, dynamic>;
            return fromJson(jsonObject);
          }
      }
    }

    return null;
  }

  @override
  Future<void> setValue<T>(
    LocalStorageKeys key,
    T value, {
    bool isSecure = false,
  }) async {
    if (isSecure) {
      return await _secureStorage.write(
        key: key.name,
        value: value.toString(),
        aOptions: _getAndroidOptions(),
      );
    } else {
      switch (T) {
        case int:
          _prefs.setInt(key.name, value as int);
          break;
        case double:
          _prefs.setDouble(key.name, value as double);
          break;
        case String:
          _prefs.setString(key.name, value as String);
          break;
        case bool:
          _prefs.setBool(key.name, value as bool);
          break;
        default:
          final stringObject = jsonEncode(value);
          _prefs.setString(key.name, stringObject);
      }
    }
  }

  @override
  Future<void> deleteKey(LocalStorageKeys key, {bool isSecure = false}) async {
    if (isSecure) {
      await _secureStorage.delete(
        key: key.name,
        aOptions: _getAndroidOptions(),
      );
    } else {
      _prefs.remove(key.name);
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}