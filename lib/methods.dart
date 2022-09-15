import 'dart:convert';
import 'dart:io';

import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

import 'company.dart';

final companyList = <Company>[];

String inputUser(String text) {
  print(text);
  final dataRegistration = stdin.readLineSync(encoding: utf8)!;
  return dataRegistration;
}

void addCompany() {
  Company company = Company.addCompany();
  companyList.add(company); 
}

void viewCompany(company) {
  print('''
    ID: ${company.uuid}
    CNPJ: ${company.entityRegister} Data de Cadastro: ${company.registerDate}
    Razão Social: ${company.corporateName}
    Nome Fantasia: ${company.publicName}
    Telefone: ${company.phoneValidateAndFormated()}
    Endereço: ${company.address.streetName}, ${company.address.placeNumber}, ${company.address.placeComplement}, ${company.address.placeDistrict}, ${company.address.zipCodeValidateAndFormated()}, ${company.address.placeState}''');
  if (CPFValidator.isValid(company.companyPartner.entityRegister)) {
    print('''Sócio:
    CPF: ${company.companyPartner.entityRegister}
    Nome Completo: ${company.companyPartner.personName}
    Endereço: ${company.companyPartner.address.streetName}, ${company.companyPartner.address.placeNumber}, ${company.companyPartner.address.placeComplement}, ${company.companyPartner.address.placeDistrict}, ${company.companyPartner.address.zipCodeValidateAndFormated()}, ${company.companyPartner.address.placeState}''');
    return;
  }if (CNPJValidator.isValid(company.companyPartner.entityRegister)) {
    print('''Sócio:
    CNPJ: ${company.companyPartner.entityRegister}
    Razão Social: ${company.companyPartner.corporateName}
    Nome Fantasia: ${company.companyPartner.publicName}
    Endereço: ${company.companyPartner.address.streetName}, ${company.companyPartner.address.placeNumber}, ${company.companyPartner.address.placeComplement}, ${company.companyPartner.address.placeDistrict}, '${company.companyPartner.zipCodeValidateAndFormated()}', ${company.companyPartner.address.placeState}  ''');
  }
}

void viewListCompanies(List companyList) {
  if (companyList.isNotEmpty) {
    companyList.sort((a, b) => a.corporateName.compareTo(b.corporateName));
    for (var i = 0; i < companyList.length; i++) {
      viewCompany(companyList[i]);
    }
    return;
  }
}

void searchByCNPJ(List companyList, String input) {
  while (input != '0') {
    String input = inputUser('\nDigite o CNPJ a buscar ou 0 para sair');
    for (var i = 0; i < companyList.length; i++) {
      if (companyList[i].entityRegister == input) {
        viewCompany(companyList[i]);
        return;
      }
    }
    print('\nEmpresa não encontrada!');
  }
}

void searchByCPF(List companyList, String input) {
  while (input != '0') {
    String input = inputUser('\nDigite o CPF a buscar ou 0 para sair');
    for (var i = 0; i < companyList.length; i++) {
      if (companyList[i].companyPartner.entityRegister == input) {
        viewCompany(companyList[i]);
      }
    }
    print('\nEmpresa não encontrada!');
  }
}

void deleteByID(List companyList) {
  if (companyList.isNotEmpty) {
    viewListCompanies(companyList);
    stdout.write('\nDigite o ID da empresa que será deletada:');
    String input = stdin.readLineSync()!;
    print('');
    for (var i = 0; i < companyList.length; i++) {
      if (companyList[i].uuid == input) {
        viewCompany(companyList[i]);
        companyList.removeAt(i);
        print('\nEmpresa deletada do programa.');
        return;
      }
      print('\nEmpresa não encontrada.');
    }
  }
}
