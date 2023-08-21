import 'dart:io';

class ProgramaContatos {
  // atributos
  int menuAtual = 0;
  bool sair = false;
  final Map<String, String> contatos = {"Jeremias": "12345678"};
  var opcoes = [1, 2, 3, 4, 5];
  int opcaoAtual = 0;

  // funções
  void demonstrarOpcoes() {
    switch (menuAtual) {
      // opções menu principal
      case 0:
        print('  - Gerenciador de Contatos -');
        print('1 - Adicionar contato');
        print('2 - Ver contatos');
        print('3 - Editar um contato');
        print('4 - Remover um contato');
        print('5 - Sair');
        int inputOpcao = int.parse(stdin.readLineSync()!);
        if ((inputOpcao > 0) &
            (inputOpcao < 6) &
            (inputOpcao.runtimeType == int)) {
          opcaoAtual = inputOpcao;
          processarOpcao();
        } else {
          invalidarOpcao();
        }
        break;
      // opções adicionar contato
      case 1:
        print(' - Adicionar um contato - ');
        print('1 - Inserir nome e número do contato');
        print('2 - Retornar ao menu principal');
        int inputOpcao = int.parse(stdin.readLineSync()!);
        if ((inputOpcao > 0) & (inputOpcao < 3)) {
          opcaoAtual = inputOpcao;
          processarOpcao();
        } else {
          invalidarOpcao();
        }
        break;
      // opções visualizar contatos
      case 2:
        print(' - Seus contatos - ');
        if (contatos.isEmpty) {
          print('Que pena, você não possui nenhum contato registrado...');
        } else {
          print('Nome - Número');
          contatos.forEach((key, value) {
            print("$key - $value");
          });
        }
        print('1 - Retornar ao menu principal');
        int inputOpcao = int.parse(stdin.readLineSync()!);
        if (inputOpcao == 1) {
          opcaoAtual = inputOpcao;
          processarOpcao();
        } else {
          invalidarOpcao();
        }
        break;
      // opções editar contatos
      case 3:
        int contador = 2;
        print(' - Editar um contato - ');
        print('Opção - Nome - Número');
        contatos.forEach((key, value) {
          print("$contador - $key - $value");
          contador++;
        });
        print('1 - Retornar ao menu principal');
        int inputOpcao = int.parse(stdin.readLineSync()!);
        if (inputOpcao == 1) {
          opcaoAtual = inputOpcao;
          processarOpcao();
        } else if (inputOpcao > 1) {
          editarContato(contador, inputOpcao);
        } else {
          invalidarOpcao();
        }
        break;
      case 4:
        int contador = 2;
        print(' - Remover um contato - ');
        print('Opção - Nome - Número');
        contatos.forEach((key, value) {
          print("$contador - $key - $value");
          contador++;
        });
        print(' 1 - Retornar ao menu principal');
        int inputOpcao = int.parse(stdin.readLineSync()!);
        if (inputOpcao == 1) {
          opcaoAtual = inputOpcao;
          processarOpcao();
        } else if (inputOpcao > 1) {
          removerContato(inputOpcao);
        } else {
          invalidarOpcao();
        }
        break;
    }
  }

  void processarOpcao() {
    // decidir menu atual e quais opcoes mostrar a partir disso
    switch (menuAtual) {
      case 0:
        // menu principal
        switch (opcaoAtual) {
          case 1:
            menuAtual = 1;
            demonstrarOpcoes();
            break;
          case 2:
            menuAtual = 2;
            demonstrarOpcoes();
            break;
          case 3:
            menuAtual = 3;
            demonstrarOpcoes();
            break;
          case 4:
            menuAtual = 4;
            demonstrarOpcoes();
            break;
          case 5:
            exit(0);
          default:
            print('Opção inválida');
            demonstrarOpcoes();
        }
        break;
      case 1:
        // menu add contato
        switch (opcaoAtual) {
          // adicionar contato
          case 1:
            adicionarContato();
            break;
          // voltar ao menu principal
          case 2:
            menuAtual = 0;
            demonstrarOpcoes();
            break;
        }
        break;
      case 2:
        // menu ver contatos
        switch (opcaoAtual) {
          // retornar ao menu principal
          case 1:
            menuAtual = 0;
            demonstrarOpcoes();
        }
        break;
      case 3:
        // menu editar contatos
        switch (opcaoAtual) {
          case 1:
            menuAtual = 0;
            demonstrarOpcoes();
        }
        break;
      case 4:
        // menu remover contatos
        switch (opcaoAtual) {
          case 1:
            menuAtual = 0;
            demonstrarOpcoes();
        }
        break;
      case 5:
        exit(0);
    }
  }

  void invalidarOpcao() {
    print('Opção inválida! Tente novamente...');
    demonstrarOpcoes();
  }

  void adicionarContato() {
    print('Insira o nome do contato:');
    String? nomeParaAdicionar = stdin.readLineSync()!;
    print('Insira o número do contato:');
    contatos[nomeParaAdicionar] = stdin.readLineSync()!;
    print('Contato adicionado!');
    demonstrarOpcoes();
  }

  void editarContato(numContatos, contatoEscolhido) {
    if ((contatoEscolhido < numContatos) &
        (contatoEscolhido.runtimeType == int)) {
      String nomeAnterior = contatos.keys.elementAt(contatoEscolhido - 2);
      print('Escolha um novo número para o contato:');
      String novoNumero = stdin.readLineSync()!;
      contatos[nomeAnterior] = novoNumero;
      print('Número alterado com sucesso!');
      demonstrarOpcoes();
    } else {
      invalidarOpcao();
    }
  }

  void removerContato(contatoEscolhido) {
    contatos.remove(contatos.keys.elementAt(contatoEscolhido - 2));
    print('Contato removido com sucesso!');
    demonstrarOpcoes();
  }
}

void main() {
  var programa = ProgramaContatos();
  programa.demonstrarOpcoes();
}
