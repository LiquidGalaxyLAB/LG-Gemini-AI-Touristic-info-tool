import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils {
  static final PreferencesUtils _instance = PreferencesUtils._internal();

  factory PreferencesUtils() {
    return _instance;
  }

  PreferencesUtils._internal();

  // Save a value
  Future<void> saveValue(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (value) {
      case String():
        await prefs.setString(key, value);
      case int():
        await prefs.setInt(key, value);
      case double():
        await prefs.setDouble(key, value);
      case bool():
        await prefs.setBool(key, value);
      case List<String>():
        await prefs.setStringList(key, value);
      default:
        throw Exception('Invalid value type');
    }
  }

  // Get a value
  Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == List<String>) {
      return prefs.getStringList(key) as T?;
    } else {
      return null;
    }
  }

  // Update a value
  Future<void> updateValue(String key, dynamic newValue) async {
    await saveValue(key, newValue);
  }

  // Delete a value
  Future<void> deleteValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

// Usage example:
// Saving a value
// await PreferencesUtils().saveValue('key', 'value');

// Getting a value
// var value = await PreferencesUtils().getValue('key');

// Updating a value
// await PreferencesUtils().updateValue('key', 'newValue');

// Deleting a value
// await PreferencesUtils().deleteValue('key');
