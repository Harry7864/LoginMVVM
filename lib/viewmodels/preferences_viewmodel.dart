import 'package:demo_task/models/preference_model.dart';
import 'package:demo_task/services/hive_service.dart';
import 'package:flutter/cupertino.dart';

class PreferenceViewModel extends ChangeNotifier {
  Preferences preferences = HiveService.getPreferences();

  bool get isDarkTheme => preferences.isDarkTheme;

  String get sortOrder => preferences.sortOrder;

  void toggleTheme() {
    preferences.isDarkTheme = !preferences.isDarkTheme;
    HiveService.savePreferences(preferences);
    notifyListeners();
  }

  void updateSortOrder(String order) {
    preferences.sortOrder = order;
    HiveService.savePreferences(preferences);
    notifyListeners();
  }
}
