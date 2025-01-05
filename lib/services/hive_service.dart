import 'package:hive_flutter/hive_flutter.dart';

import '../models/preference_model.dart';

class HiveService {
  static const _preferencesBox = 'preferences';

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PreferencesAdapter());
    await Hive.openBox<Preferences>(_preferencesBox);
  }

  static Preferences getPreferences() {
    final box = Hive.box<Preferences>(_preferencesBox);
    return box.get('preferences') ?? Preferences(isDarkTheme: false, sortOrder: 'date');
  }

  static void savePreferences(Preferences preferences) {
    final box = Hive.box<Preferences>(_preferencesBox);
    box.put('preferences', preferences);
  }
}
