// ignore_for_file: unused_element

import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class {{project_name.pascalCase()}}Storage {
  {{project_name.pascalCase()}}Storage(SharedPreferences sharedPreferences) : _prefs = sharedPreferences;
  
  // Getters  
  bool get isUsingBiometrics =>
      _prefs.getBool(StorageConstants.isUsingBiometrics) ?? true;
  bool get isDarkMode =>
      _prefs.getBool(StorageConstants.isDarkMode) ?? true;

  // Setters
  set isUsingBiometrics(bool value) =>
      _updateBool(StorageConstants.isUsingBiometrics, value);
  set isDarkMode(bool value) =>
      _updateBool(StorageConstants.isDarkMode, value);

  // Functions
  void _updateBool(String key, bool? value) =>
      value == null ? _prefs.remove(key) : _prefs.setBool(key, value);

  void _updateInt(String key, int? value) =>
      value == null ? _prefs.remove(key) : _prefs.setInt(key, value);

  void _updateString(String key, String? value) =>
      value == null ? _prefs.remove(key) : _prefs.setString(key, value);

  final SharedPreferences _prefs;
}