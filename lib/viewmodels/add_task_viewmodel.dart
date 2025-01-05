import 'package:demo_task/viewmodels/task_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';

class AddTaskViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleTEC = TextEditingController();
  TextEditingController descTEC = TextEditingController();
  bool isCompleted = false;
  DateTime? selectedDate;

  int? taskId;
  Task? task;

  Future<void> showDatePickerDialog(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null) {
      selectedDate = date;
    }
    notifyListeners();
  }

  void addNote(BuildContext context) async {
    if ((formKey.currentState!.validate())) {
      final viewModel = Provider.of<TaskViewModel>(context, listen: false);
      if (task == null) {
        final task = Task(
            title: titleTEC.text,
            description: descTEC.text,
            dueDate: selectedDate!,
            isComplete: isCompleted);
        await viewModel.addTask(task);

      } else {
        final taskData = Task(
            id: task?.id,
            title: titleTEC.text,
            description: descTEC.text,
            dueDate: selectedDate!,
            isComplete: isCompleted);
        await viewModel.updateTask(taskData);
      }
      if (!context.mounted) return;
      Navigator.pop(context);
    }
    /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Please select date',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        duration: Duration(seconds: 2),
      ));*/
  }

  void initializeData(Task taskData) {
    task = taskData;
    taskId = taskData.id;
    titleTEC = TextEditingController(text: taskData.title);
    descTEC = TextEditingController(text: taskData.description);
    selectedDate = taskData.dueDate;
    isCompleted = taskData.isComplete;
    notifyListeners();
  }

  void toggleTask() {
    isCompleted = !isCompleted;
    notifyListeners();
  }

  void clearData() {
    titleTEC = TextEditingController();
    descTEC = TextEditingController();
    isCompleted = false;
    task = null;
    notifyListeners();
  }
}
