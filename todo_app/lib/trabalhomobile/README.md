# Trabalho 2 - Sistema CRUD de Biblioteca em Dart

**Disciplina:** Desenvolvimento Mobile  
**Curso:** Engenharia de Software ESOFT7S / Análise e Desenvolvimento de Sistemas ADSIS5S  
**Universidade:** Unicesumar  
**Valor:** 2,5 pontos

---

## 📋 Descrição do Sistema

Este trabalho consiste na implementação de um sistema de gerenciamento de biblioteca utilizando a linguagem Dart e os princípios da Programação Orientada a Objetos. O sistema funciona via terminal e implementa as operações básicas de um CRUD (Create, Read, Update, Delete) para cadastro de livros.

✅ Funcionalidades implementadas:
- Cadastrar novos livros
- Listar todos os livros cadastrados
- Atualizar informações de livros existentes
- Remover livros da biblioteca
- Menu interativo para navegação
- Validações de entrada
- Mensagens amigáveis ao usuário

---

## 🏗️ Estrutura das Classes

### 1. Classe `Livro`
Representa a entidade principal do sistema.

| Atributo            | Tipo   | Descrição                                    |
|---------------------|--------|----------------------------------------------|
| `_id`               | int    | Identificador único do livro (auto incremento) |
| `_titulo`           | String | Título do livro                              |
| `_autor`            | String | Nome do autor do livro                       |
| `_anoPublicacao`    | int    | Ano em que o livro foi publicado             |
| `_isbn`             | String | Código ISBN do livro                         |

✅ Características OOP aplicadas:
- Encapsulamento (atributos privados)
- Getters e Setters
- Construtor padrão
- Método `toString()` sobrescrito
- Polimorfismo

### 2. Classe `GerenciadorBiblioteca`
Responsável por toda a lógica de negócio e operações do sistema.

| Atributo     | Tipo          | Descrição                                     |
|--------------|---------------|-----------------------------------------------|
| `_livros`    | List\<Livro\> | Lista dinâmica que armazena todos os livros   |
| `_proximoId` | int           | Controle de auto incremento do ID dos livros  |

✅ Métodos implementados:
| Método             | Responsabilidade                                    |
|--------------------|-----------------------------------------------------|
| `cadastrarLivro()` | Operação CREATE - Adiciona novo livro na lista      |
| `listarLivros()`   | Operação READ - Exibe todos os livros cadastrados   |
| `atualizarLivro()` | Operação UPDATE - Modifica dados de um livro        |
| `removerLivro()`   | Operação DELETE - Remove livro da lista             |
| `exibirMenu()`     | Mostra o menu principal de opções                   |
| `iniciar()`        | Loop principal do sistema                           |
| `_buscarLivroPorId()` | Método auxiliar privado para busca por ID         |

---

## 🚀 Instruções para Execução

1. **Pré-requisito:** Ter o Dart SDK instalado na máquina
   > Download: https://dart.dev/get-dart

2. **Clone o repositório:**
   ```bash
   git clone https://github.com/VagnerGiraldinoJr/trabalhomobile_1-.git
   cd trabalhomobile_1-
   ```

3. **Execute o programa:**
   ```bash
   dart main.dart
   ```

---

## 📖 Exemplos de Uso

### Menu Principal:
```
==================================================
📚 SISTEMA DE GERENCIAMENTO DE BIBLIOTECA
==================================================
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair
==================================================
Escolha uma opção:
```

### Cadastrando um Livro:
```
=== CADASTRO DE NOVO LIVRO ===
Digite o título do livro: Clean Code
Digite o autor do livro: Robert C. Martin
Digite o ano de publicação: 2008
Digite o ISBN do livro: 978-0132350884

✅ Livro cadastrado com sucesso! ID: 1
```

### Visualizando Livros Cadastrados:
```
=== LISTA DE LIVROS CADASTRADOS ===
╔══════════════════════════════════════════════
║ ID: 1
║ Título: Clean Code
║ Autor: Robert C. Martin
║ Ano: 2008
║ ISBN: 978-0132350884
╚══════════════════════════════════════════════

📚 Total de livros: 1
```

---

## ✅ Requisitos Técnicos Atendidos

| Requisito | Status |
|-----------|--------|
| Utilização de Classes | ✅ Implementado |
| Atributos com encapsulamento | ✅ Implementado |
| Métodos de instância | ✅ Implementado |
| Construtores | ✅ Implementado |
| Lista para armazenamento de objetos | ✅ Implementado |
| Operações CRUD completas | ✅ Implementado |
| Menu interativo no terminal | ✅ Implementado |
| Validações de entrada | ✅ Implementado |

