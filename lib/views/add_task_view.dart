import 'package:demo_task/viewmodels/add_task_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';

class AddTaskView extends StatefulWidget {
  final Task? task;

  const AddTaskView({super.key, this.task});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (widget.task != null) {
          Provider.of<AddTaskViewModel>(context, listen: false)..clearData()
              ..initializeData(widget.task!);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body:
          Consumer<AddTaskViewModel>(builder: (context, taskViewModel, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: taskViewModel.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: taskViewModel.titleTEC,
                    maxLines: 1,
                    maxLength: 50,
                    decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        label: Text(
                          'Title',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: taskViewModel.descTEC,
                    maxLines: 4,
                    maxLength: 200,

                    decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        label: Text(
                          'Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        )),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () =>
                            taskViewModel.showDatePickerDialog(context),
                      ),
                      Text(
                        taskViewModel.selectedDate == null
                            ? 'Pick a due date'
                            : DateFormat('dd-MM-yyyy')
                                .format(taskViewModel.selectedDate!.toLocal())
                                .toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SwitchListTile(
                    title: const Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    value: taskViewModel.isCompleted,
                    onChanged: (value) {
                      taskViewModel.toggleTask();
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        clipBehavior: Clip.hardEdge,
                        onPressed: () => taskViewModel.addNote(context),
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
