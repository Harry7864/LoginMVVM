import 'package:flutter/material.dart';
import '../models/task_model.dart';

typedef TaskCallback = void Function();

class TaskTile extends StatelessWidget {
  final Task? task;
  final TaskCallback? onTap;
  final TaskCallback? onDelete;
  final TaskCallback? onEdit;

  const TaskTile(
      {super.key,
      required this.task,
      required this.onTap,
      this.onDelete,
      this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            task?.title ?? '',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Spacer(),
          GestureDetector(onTap: () {
            onTap!();
          }, child: const Icon(Icons.edit)),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(onTap: () {
            onDelete!();
          }, child: const Icon(Icons.delete))
        ],
      ),
      subtitle: Text(
        task?.description ?? '',
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
      ),

    );
  }
}
