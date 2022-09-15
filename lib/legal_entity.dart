import 'dart:convert';
import 'dart:io';

import 'package:cpf_cnpj_validator/cnpj_validator.dart';

import 'address.dart';
import 'inputs.dart';
import 'partner.dart';


class LegalEntity implements Partner {
  late String corporateName;
  late String publicName;
  late String _entityRegister;
  @override
  late Address address;

  String get entityRegister => _entityRegister;

  LegalEntity.addPartner() {
    corporateName = inputUser("Informe a Razão Social da entidade.");
    publicName = inputUser("Informe o Nome Fantasia da entidade.");
    _entityRegister = inputUser("Informe o CNPJ da entidade");
    while (!(CNPJValidator.isValid(_entityRegister))) {
      stdout.write("CNPJ Inválido. Tente novamente.");
      _entityRegister = stdin.readLineSync(encoding: utf8)!;
    }
    address = Address.addAddress();

    _entityRegister = CNPJValidator.format(entityRegister);
  }
}
