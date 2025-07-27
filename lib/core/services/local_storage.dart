import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalStorageService {
  static const String _boxName = 'settings';
  static late Box _box;

  /// Hive init & box open
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  /// Save any value by key
  static Future<void> setValue(String key, dynamic value) async {
    await _box.put(key, value);
  }

  /// Get value by key
  static T? getValue<T>(String key) {
    return _box.get(key);
  }

  /// Check if key exists
  static bool containsKey(String key) {
    return _box.containsKey(key);
  }

  /// Delete specific key
  static Future<void> delete(String key) async {
    await _box.delete(key);
  }

  /// Clear all data
  static Future<void> clearAll() async {
    await _box.clear();
  }

  /// Close box
  static Future<void> close() async {
    await _box.close();
  }
}
