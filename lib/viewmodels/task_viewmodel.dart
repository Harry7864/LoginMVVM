import 'package:demo_task/services/sqlite_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/task_model.dart';
import '../services/notification_service.dart';

class TaskViewModel extends ChangeNotifier {
  SQLiteService sqLiteService = SQLiteService.instance;
  List<Task> taskList = [];
  List<Task> allTaskList = [];

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchTasks() async {
    taskList = await sqLiteService.fetchTasks();
    allTaskList = await sqLiteService.fetchTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await sqLiteService.addTask(task);
    await fetchTasks();
    await NotificationService().showNotification(
      title: 'Task Added',
      body: 'Your task "${task.title}" has been added successfully!',
    );
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    await sqLiteService.updateTask(task);
    await fetchTasks();
    notifyListeners();
  }

  Future<void> deleteTask(int id) async {
    await sqLiteService.deleteTask(id);
    await fetchTasks();
  }

  void searchTask(String query) {
    taskList = allTaskList
        .where(
          (element) =>
              element.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void filterList(String filter) {
    if (filter == 'Completed') {
      taskList = allTaskList.where((element) => element.isComplete).toList();
    } else if (filter == 'Pending') {
      taskList = allTaskList.where((element) => !element.isComplete).toList();
    } else {
      taskList = List.from(allTaskList);
    }
    debugPrint("TaskList :: $taskList");
    notifyListeners();
  }


  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void clearText() {
    isSearching = false;
    searchController.clear();
    notifyListeners();
  }
}
