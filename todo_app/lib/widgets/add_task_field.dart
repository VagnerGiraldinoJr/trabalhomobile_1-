// lib/widgets/add_task_field.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class AddTaskField extends ConsumerStatefulWidget {
  const AddTaskField({super.key});

  @override
  ConsumerState<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends ConsumerState<AddTaskField> {
  final _controller = TextEditingController();

  void _submit() {
    if (_controller.text.trim().isNotEmpty) {
      ref.read(taskProvider.notifier).addTask(_controller.text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _submit(),
              decoration: const InputDecoration(
                hintText: 'Nova tarefa...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
