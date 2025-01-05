import 'package:demo_task/viewmodels/add_task_viewmodel.dart';
import 'package:demo_task/viewmodels/country_view_model.dart';
import 'package:demo_task/viewmodels/preferences_viewmodel.dart';
import 'package:demo_task/views/country_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/hive_service.dart';
import 'services/notification_service.dart';
import 'services/sqlite_service.dart';
import 'viewmodels/task_viewmodel.dart';
import 'views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.initHive();
  await SQLiteService.instance.database;
  await NotificationService().initializeSetting();
  await NotificationService.instance.requestNotificationPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => PreferenceViewModel()),
        ChangeNotifierProvider(create: (_) => AddTaskViewModel()),
        ChangeNotifierProvider(create: (_) => CountryViewModel()),
      ],
      child: Consumer<PreferenceViewModel>(
        builder: (context, preferencesViewModel, child) {
          return MaterialApp(
            theme: preferencesViewModel.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const CountryListView(),
          );
        },
      ),
    );
  }
}
