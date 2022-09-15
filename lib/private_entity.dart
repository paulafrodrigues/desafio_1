import 'dart:io';

import 'package:cpf_cnpj_validator/cpf_validator.dart';

import 'address.dart';
import 'inputs.dart';
import 'partner.dart';


class PrivateEntity implements Partner {
  late String personName;
  late String _entityRegister;
  @override
  late Address address;

  String get entityRegister => _entityRegister;

  PrivateEntity.addPartner() {
    personName = inputUser("Informe o nome do sócio.");
    _entityRegister = inputUser("Informe o CPF do sócio");
    while (!(CPFValidator.isValid(_entityRegister))) {
      stdout.write("CPF Inválido. Tente novamente.");
      _entityRegister = stdin.readLineSync()!;
    }
    address = Address.addAddress();

    _entityRegister = CPFValidator.format(entityRegister);
  }
}
