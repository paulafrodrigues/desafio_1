import 'dart:convert';
import 'dart:io';

import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:uuid/uuid.dart';

import 'address.dart';
import 'inputs.dart';
import 'partner.dart';


class Company {
  late String uuid = Uuid().v4();
  late DateTime registerDate = DateTime.now();
  late String corporateName;
  late String publicName;
  late String _entityRegister;
  late String _phoneNumber;
  late Address address;
  late Partner companyPartner;

  String get entityRegister => _entityRegister;
  String get phoneNumber => _phoneNumber;

  String phoneValidateAndFormated() {
    String phone;
    if (_phoneNumber.length == 11) {
      phone =
          '(${_phoneNumber.substring(0, 2)}) ${_phoneNumber.substring(2, 3)} ${_phoneNumber.substring(3, 7)}-${_phoneNumber.substring(7)}';
    } else {
      phone =
          '(${_phoneNumber.substring(0, 2)}) ${_phoneNumber.substring(2, 6)}-${_phoneNumber.substring(6)}';
    }
    return phone;
  }

  Company.addCompany() {
    print('''
      *CADASTRO EMPRESA*
  ''');
    corporateName = inputUser("Informe a Razão Social");
    _entityRegister = inputUser("Informe o CNPJ");
    while (!(CNPJValidator.isValid(_entityRegister))) {
      stdout.write("CNPJ inválido. Tente novamente.");
      _entityRegister = inputUser("Informe o CNPJ novamente.");
    }
    publicName = inputUser("Informe o Nome Fantasia");
    _phoneNumber = inputUser("Informe o telefone");
    address = Address.addAddress();
    _entityRegister = CNPJValidator.format(_entityRegister);
    stdout.write(
        "Qual o tipo de Sócio a ser cadastrado: \n 1 - Pessoa Física\n 2 - Pessoa Jurídica.\n Escolha uma das opções.\n");
    String input = stdin.readLineSync(encoding: utf8)!;
    companyPartner = Partner.addPartner(input);
  }
}
