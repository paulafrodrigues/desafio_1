import 'dart:convert';
import 'dart:io';

import 'package:desafio_1/methods.dart';

void main() {
  String menuOption = '';
  do {
    print('''
    
    * MENU *
    1) Cadastrar uma nova empresa.
    2) Buscar empresa cadastrada por CNPJ.
    3) Buscar empresa cadastrada por CPF do Sócio.
    4) Listar empresas cadastradas (Por Razão Social).
    5) Excluir empresa (Por ID).
    0) Sair.

''');
    menuOption = stdin.readLineSync(encoding: utf8)!;
    switch (menuOption) {
      case '1':
        addCompany();
        break;
      case '2':
        searchByCNPJ(companyList, 'CNPJ: ');
        break;
      case '3':
        searchByCPF(companyList, 'CPF: ');
        break;
      case '4':
        viewListCompanies(companyList);
        break;
      case '5':
        deleteByID(companyList);
        break;
      default:
        print('\nAté a próxima!');
    }
  } while (menuOption != '0');
}
