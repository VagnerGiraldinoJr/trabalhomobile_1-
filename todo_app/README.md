# ✅ Todo App — Lista de Tarefas com Flutter & Riverpod

Aplicativo de gerenciamento de tarefas desenvolvido em Flutter.

---

## 📱 Funcionalidades

| Funcionalidade | Descrição |
|---|---|
| ➕ Adicionar tarefa | Campo de texto + botão na barra inferior |
| 📋 Visualizar tarefas | Lista rolável com todas as tarefas |
| ✔️ Marcar como concluída | Toque no círculo ou no título da tarefa |
| 🗑️ Remover tarefa | Botão de lixeira ou deslize para a esquerda |
| 🧹 Limpar concluídas | Botão "Limpar" remove todas de uma vez |
| 📊 Barra de progresso | Mostra quantas tarefas foram concluídas |

---

## 🏗️ Arquitetura e Estrutura do Projeto

```
lib/
├── main.dart                  # Ponto de entrada, configuração do tema e ProviderScope
├── models/
│   └── task.dart              # Modelo de dados da tarefa (imutável)
├── providers/
│   └── task_provider.dart     # Gestão de estado com Riverpod
├── screens/
│   └── home_screen.dart       # Tela principal do aplicativo
└── widgets/
    ├── task_item.dart          # Widget de item individual da lista
    ├── add_task_field.dart     # Campo de entrada + botão de adicionar
    ├── stats_bar.dart          # Barra de progresso/estatísticas
    └── empty_state.dart        # Estado vazio (sem tarefas)
```

---

## ⚙️ Gestão de Estado com Riverpod

A gestão de estado foi implementada usando o padrão **StateNotifier + StateNotifierProvider** do Riverpod.

### Como funciona

#### 1. Modelo imutável (`Task`)
```dart
class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;
  
  // copyWith para criar cópias com campos alterados
  Task copyWith({...}) => Task(...);
}
```

#### 2. `TaskNotifier` — lógica de estado
```dart
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]); // estado inicial: lista vazia

  void addTask(String title) {
    state = [...state, newTask]; // sempre cria nova lista
  }

  void toggleTask(String id) {
    state = state.map((t) => t.id == id
      ? t.copyWith(isCompleted: !t.isCompleted)
      : t
    ).toList();
  }

  void removeTask(String id) {
    state = state.where((t) => t.id != id).toList();
  }
}
```

#### 3. Providers declarados
```dart
// Provider principal
final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>(
  (ref) => TaskNotifier(),
);

// Providers derivados (computados automaticamente)
final pendingCountProvider = Provider<int>(
  (ref) => ref.watch(taskProvider).where((t) => !t.isCompleted).length,
);

final completedCountProvider = Provider<int>(
  (ref) => ref.watch(taskProvider).where((t) => t.isCompleted).length,
);
```

#### 4. Consumo nos widgets
```dart
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lê e observa o estado (rebuild automático ao mudar)
    final tasks = ref.watch(taskProvider);

    // Chama métodos do notifier
    ref.read(taskProvider.notifier).addTask("Nova tarefa");
  }
}
```

### Diagrama do fluxo

```
Usuário interage
      │
      ▼
  Widget (UI)
  ref.read(taskProvider.notifier).addTask(...)
      │
      ▼
  TaskNotifier
  state = [...state, novaTarefa]
      │
      ▼
  Riverpod detecta mudança de estado
      │
      ▼
  Todos os widgets com ref.watch(taskProvider) fazem rebuild
      │
      ▼
  UI atualizada automaticamente
```

---

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK `>=3.0.0` instalado
- Emulador Android/iOS ou dispositivo físico conectado

### Passos

```bash
# 1. Clone ou navegue até a pasta do projeto
cd todo_app

# 2. Instale as dependências
flutter pub get

# 3. Execute o aplicativo
flutter run
```

### Dependências utilizadas

| Pacote | Versão | Uso |
|---|---|---|
| `flutter_riverpod` | ^2.5.1 | Gestão de estado |
| `uuid` | ^4.3.3 | Gerar IDs únicos para tarefas |
| `flutter_slidable` | ^3.1.0 | Deslize para deletar |
| `google_fonts` | ^6.2.1 | Tipografia |

---

## 🧪 Conceitos de Flutter Aplicados

- **`ListView.builder`** — renderização eficiente da lista (lazy loading)
- **`ConsumerWidget`** — widget que observa providers do Riverpod
- **`ConsumerStatefulWidget`** — para o campo de texto com controller local
- **`StateNotifier`** — encapsula a lógica de mutação do estado
- **`Provider` derivado** — valores computados que se atualizam automaticamente
- **`AnimatedContainer` / `TweenAnimationBuilder`** — feedback visual animado
- **`Slidable`** — gesto de deslize para ação de remoção

---

## 📸 Interface

### Tela Principal
- AppBar com título e botão "Limpar concluídas" (aparece quando há concluídas)
- Barra de progresso mostrando `X concluídas de Y`
- Lista de tarefas com `ListView.builder`
- Campo fixo na parte inferior para adicionar tarefas

### Indicação Visual de Conclusão
- Círculo verde com ✓ ao lado da tarefa concluída
- Texto tachado (riscado) na tarefa concluída
- Cor mais apagada para tarefas concluídas
- Animação suave na transição de estado

---

## 👥 Grupo

> Preencha com os nomes dos integrantes do grupo.

- Nome 1 — RA: XXXXXXX
- Nome 2 — RA: XXXXXXX
- Nome 3 — RA: XXXXXXX
