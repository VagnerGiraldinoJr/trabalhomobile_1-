// lib/widgets/empty_state.dart

import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nenhuma tarefa ainda.\nAdicione uma acima!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}
