// lib/widgets/task_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskItem extends ConsumerWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) =>
            ref.read(taskProvider.notifier).toggleTask(task.id),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.isCompleted ? TextDecoration.lineThrough : null,
          color: task.isCompleted ? Colors.grey : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () =>
            ref.read(taskProvider.notifier).removeTask(task.id),
      ),
    );
  }
}
