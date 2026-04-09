import 'dart:io';

// Classe Livro que representa a entidade livro na biblioteca
class Livro {
  // Atributos privados
  int _id;
  String _titulo;
  String _autor;
  int _anoPublicacao;
  String _isbn;

  // Construtor padrão
  Livro(this._id, this._titulo, this._autor, this._anoPublicacao, this._isbn);

  // Getters
  int get id => _id;
  String get titulo => _titulo;
  String get autor => _autor;
  int get anoPublicacao => _anoPublicacao;
  String get isbn => _isbn;

  // Setters
  set titulo(String novoTitulo) => _titulo = novoTitulo;
  set autor(String novoAutor) => _autor = novoAutor;
  set anoPublicacao(int novoAno) => _anoPublicacao = novoAno;
  set isbn(String novoIsbn) => _isbn = novoIsbn;

  // Método para exibir informações formatadas do livro
  @override
  String toString() {
    return '''
╔══════════════════════════════════════════════
║ ID: $_id
║ Título: $_titulo
║ Autor: $_autor
║ Ano: $_anoPublicacao
║ ISBN: $_isbn
╚══════════════════════════════════════════════''';
  }
}

// Classe responsável por gerenciar todas as operações da biblioteca
class GerenciadorBiblioteca {
  // Lista para armazenar os livros cadastrados
  List<Livro> _livros = [];
  int _proximoId = 1;

  // Método CREATE: Cadastrar novo livro
  void cadastrarLivro() {
    print("\n=== CADASTRO DE NOVO LIVRO ===");
    
    stdout.write("Digite o título do livro: ");
    String titulo = stdin.readLineSync() ?? "";
    
    stdout.write("Digite o autor do livro: ");
    String autor = stdin.readLineSync() ?? "";
    
    stdout.write("Digite o ano de publicação: ");
    int ano = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
    
    stdout.write("Digite o ISBN do livro: ");
    String isbn = stdin.readLineSync() ?? "";

    Livro novoLivro = Livro(_proximoId, titulo, autor, ano, isbn);
    _livros.add(novoLivro);
    _proximoId++;

    print("\n✅ Livro cadastrado com sucesso! ID: ${novoLivro.id}");
  }

  // Método READ: Listar todos os livros cadastrados
  void listarLivros() {
    print("\n=== LISTA DE LIVROS CADASTRADOS ===");
    
    if (_livros.isEmpty) {
      print("\n⚠️ Nenhum livro cadastrado na biblioteca.");
      return;
    }

    for (Livro livro in _livros) {
      print(livro);
    }
    print("\n📚 Total de livros: ${_livros.length}");
  }

  // Método UPDATE: Atualizar informações de um livro existente
  void atualizarLivro() {
    print("\n=== ATUALIZAR LIVRO ===");
    
    stdout.write("Digite o ID do livro que deseja atualizar: ");
    int id = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    Livro? livro = _buscarLivroPorId(id);
    
    if (livro == null) {
      print("\n❌ Livro com ID $id não encontrado.");
      return;
    }

    print("\nLivro encontrado:");
    print(livro);

    print("\nDeixe em branco para manter o valor atual:");
    
    stdout.write("Novo título [${livro.titulo}]: ");
    String novoTitulo = stdin.readLineSync() ?? "";
    if (novoTitulo.isNotEmpty) livro.titulo = novoTitulo;

    stdout.write("Novo autor [${livro.autor}]: ");
    String novoAutor = stdin.readLineSync() ?? "";
    if (novoAutor.isNotEmpty) livro.autor = novoAutor;

    stdout.write("Novo ano [${livro.anoPublicacao}]: ");
    String novoAnoStr = stdin.readLineSync() ?? "";
    if (novoAnoStr.isNotEmpty) {
      int novoAno = int.tryParse(novoAnoStr) ?? livro.anoPublicacao;
      livro.anoPublicacao = novoAno;
    }

    stdout.write("Novo ISBN [${livro.isbn}]: ");
    String novoIsbn = stdin.readLineSync() ?? "";
    if (novoIsbn.isNotEmpty) livro.isbn = novoIsbn;

    print("\n✅ Livro atualizado com sucesso!");
  }

  // Método DELETE: Remover um livro da biblioteca
  void removerLivro() {
    print("\n=== REMOVER LIVRO ===");
    
    stdout.write("Digite o ID do livro que deseja remover: ");
    int id = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    Livro? livro = _buscarLivroPorId(id);
    
    if (livro == null) {
      print("\n❌ Livro com ID $id não encontrado.");
      return;
    }

    print("\nLivro a ser removido:");
    print(livro);

    stdout.write("\nConfirma remoção? (S/N): ");
    String confirmacao = stdin.readLineSync()?.toUpperCase() ?? "N";

    if (confirmacao == "S") {
      _livros.remove(livro);
      print("\n✅ Livro removido com sucesso!");
    } else {
      print("\n❌ Operação cancelada.");
    }
  }

  // Método auxiliar privado para buscar livro por ID
  Livro? _buscarLivroPorId(int id) {
    for (Livro livro in _livros) {
      if (livro.id == id) {
        return livro;
      }
    }
    return null;
  }

  // Método para exibir o menu principal
  void exibirMenu() {
    print("\n" + "="*50);
    print("📚 SISTEMA DE GERENCIAMENTO DE BIBLIOTECA");
    print("="*50);
    print("1 - Cadastrar livro");
    print("2 - Listar livros");
    print("3 - Atualizar livro");
    print("4 - Remover livro");
    print("5 - Sair");
    print("="*50);
    stdout.write("Escolha uma opção: ");
  }

  // Método principal que executa o sistema
  void iniciar() {
    print("\n🚀 Sistema de Biblioteca iniciado!");
    
    while(true) {
      exibirMenu();
      
      String? opcao = stdin.readLineSync();
      
      switch(opcao) {
        case "1":
          cadastrarLivro();
          break;
        case "2":
          listarLivros();
          break;
        case "3":
          atualizarLivro();
          break;
        case "4":
          removerLivro();
          break;
        case "5":
          print("\n👋 Saindo do sistema. Até logo!");
          return;
        default:
          print("\n❌ Opção inválida! Tente novamente.");
      }
    }
  }
}

void main() {
  GerenciadorBiblioteca biblioteca = GerenciadorBiblioteca();
  biblioteca.iniciar();
}