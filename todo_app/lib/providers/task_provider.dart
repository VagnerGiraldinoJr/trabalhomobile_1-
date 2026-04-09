// lib/providers/task_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';

const _uuid = Uuid();

// Notifier responsável por toda a lógica de estado das tarefas
class TaskNotifier extends StateNotifier<List<Task>> {
  // Inicializa com lista vazia
  TaskNotifier() : super([]);

  // Adiciona uma nova tarefa à lista
  void addTask(String title) {
    if (title.trim().isEmpty) return;

    final newTask = Task(
      id: _uuid.v4(),
      title: title.trim(),
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    // Cria nova lista (imutabilidade do estado)
    state = [...state, newTask];
  }

  // Alterna o status de conclusão de uma tarefa
  void toggleTask(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
  }

  // Remove uma tarefa pelo id
  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }

  // Remove todas as tarefas concluídas
  void clearCompleted() {
    state = state.where((task) => !task.isCompleted).toList();
  }
}

// Provider principal da lista de tarefas
final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

// Provider derivado: conta de tarefas pendentes
final pendingCountProvider = Provider<int>((ref) {
  final tasks = ref.watch(taskProvider);
  return tasks.where((t) => !t.isCompleted).length;
});

// Provider derivado: conta de tarefas concluídas
final completedCountProvider = Provider<int>((ref) {
  final tasks = ref.watch(taskProvider);
  return tasks.where((t) => t.isCompleted).length;
});
