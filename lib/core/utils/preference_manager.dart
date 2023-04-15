import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meman/core/core_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  final SharedPreferences prefs;

  PreferenceManager(this.prefs);

  List<Map<String, dynamic>> getJsonList(String key) {
    return List<Map<String, dynamic>>.from(
      jsonDecode(prefs.getString(key) ?? '[]'),
    );
  }

  Map<String, dynamic> getJsonMap(String key) {
    return Map<String, dynamic>.from(jsonDecode(prefs.getString(key) ?? '{}'));
  }

  void saveJson(String key, List<Map<String, dynamic>> json) {
    prefs.setString(key, jsonEncode(json));
  }

  void saveJsonMap(String key, Map<String, dynamic> json) {
    prefs.setString(key, jsonEncode(json));
  }

  static final provider = Provider<PreferenceManager>(
      (ref) => PreferenceManager(ref.watch(sharedPreferencesProvider)));
}
