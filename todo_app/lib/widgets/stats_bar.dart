// lib/widgets/stats_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class StatsBar extends ConsumerWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(pendingCountProvider);
    final completed = ref.watch(completedCountProvider);

    if (pending + completed == 0) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        '$pending pendente(s) · $completed concluída(s)',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
