import 'package:demo_task/viewmodels/task_viewmodel.dart';
import 'package:demo_task/views/add_task_view.dart';
import 'package:demo_task/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<TaskViewModel>(context, listen: false).fetchTasks();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Consumer<TaskViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: viewModel.isSearching
              ? TextField(
                  controller: viewModel.searchController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Search tasks...',
                    border: InputBorder.none,
                  ),
                  onChanged: (query) {
                    viewModel.searchTask(query);
                  },
                )
              : const Text('Task Management'),
          actions: [
            if (!viewModel.isSearching)
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  viewModel.toggleSearch();
                },
              ),
            if (viewModel.isSearching)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  viewModel.clearText();
                },
              ),
            PopupMenuButton<String>(
              onSelected: (filter) {
                Provider.of<TaskViewModel>(context, listen: false)
                    .filterList(filter);
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'All', child: Text('All')),
                const PopupMenuItem(
                    value: 'Completed', child: Text('Completed')),
                const PopupMenuItem(value: 'Pending', child: Text('Pending')),
              ],
            ),
          ],
        ),
        body: isTablet
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: viewModel.taskList.length,
                      itemBuilder: (context, index) {
                        final task = viewModel.taskList[index];
                        return TaskTile(
                          task: task,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskView(
                                  task: task,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Placeholder(), // Placeholder for details view
                  ),
                ],
              )
            : ListView.builder(
                itemCount: viewModel.taskList.length,
                itemBuilder: (context, index) {
                  final task = viewModel.taskList[index];
                  return TaskTile(
                    task: task,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskView(
                            task: task,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                                "Are you sure you want to delete this note?"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  viewModel.deleteTask(task.id!);
                                },
                                child: const Text('Yes'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskView(
                            task: task,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskView()),
            );
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
