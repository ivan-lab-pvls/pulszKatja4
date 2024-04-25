import 'package:shared_preferences/shared_preferences.dart';

const String _kgamesCounterKey = 'gamesCounter';
const String _kvictoryCounterKey = 'victoryCounter';
const String _klossesCounterKey = 'lossesCounter';


class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    var value = _preferences.get(key);

    print('Retrieved $key: $value');

    return value;
  }

  void _saveData(String key, dynamic value) {
    print('Saving $key: $value');

    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  int get gamesCounter => _getData(_kgamesCounterKey) ?? 0;
  set gamesCounter(int value) => _saveData(_kgamesCounterKey, value);

  int get victoryCounter => _getData(_kvictoryCounterKey) ?? 0;
  set victoryCounter(int value) => _saveData(_kvictoryCounterKey, value);

  int get lossesCounter => _getData(_klossesCounterKey) ?? 0;
  set lossesCounter(int value) => _saveData(_klossesCounterKey, value);

}