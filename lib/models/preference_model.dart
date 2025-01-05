import 'package:hive/hive.dart';
part 'preference_model.g.dart';
@HiveType(typeId: 0)
class Preferences {
  @HiveField(0)
  bool isDarkTheme;
  @HiveField(1)
  String sortOrder;

  Preferences({required this.isDarkTheme, required this.sortOrder});

  Map<String, dynamic> toMap() =>
      {'isDarkTheme': isDarkTheme, 'sortOrder': sortOrder};

  static Preferences fromMap(Map<String, dynamic> map) =>
      Preferences(isDarkTheme: map['isDarkTheme'], sortOrder: map['sortOrder']);
}
