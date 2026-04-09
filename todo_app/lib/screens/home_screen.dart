// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/task_item.dart';
import '../widgets/add_task_field.dart';
import '../widgets/stats_bar.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    final completedCount = ref.watch(completedCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          if (completedCount > 0)
            TextButton(
              onPressed: () =>
                  ref.read(taskProvider.notifier).clearCompleted(),
              child: const Text(
                'Limpar concluídas',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          const AddTaskField(),
          const StatsBar(),
          const Divider(),
          Expanded(
            child: tasks.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskItem(key: ValueKey(task.id), task: task);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
