import 'package:shared_preferences/shared_preferences.dart';

class ModeConfigRepository {
  static const String _isDark = 'isDark';

  final SharedPreferences _preferences;

  ModeConfigRepository(this._preferences);

  Future<void> setMode(bool value) async {
    _preferences.setBool(_isDark, value);
  }

  bool isDark() {
    return _preferences.getBool(_isDark) ?? false;
  }
}
