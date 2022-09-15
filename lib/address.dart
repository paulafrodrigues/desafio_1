import 'dart:io';

import 'inputs.dart';

class Address {
  final addressList = <Map<String, dynamic>>[];

  late String streetName;
  late String placeNumber;
  late String placeComplement;
  late String placeDistrict;
  late String _placeZipCode;
  late String placeState;

  String get placeZipCode => _placeZipCode;

  String zipCodeValidateAndFormated() {
    String zipCode;
    if (_placeZipCode.length != 8) {
      stdout.write("Esse Cep não existe. Tente novamente");
      zipCode = inputUser("");
    } else {
      zipCode =
          '${placeZipCode.substring(0, 2)}${placeZipCode.substring(2, 5)}-${placeZipCode.substring(5, 8)}';
    }
    return zipCode;
  }

  Address.addAddress() {
    print(' *CADASTRO ENDEREÇO*');
    streetName = inputUser("Informe o Logradouro:");
    placeNumber = inputUser("Informe o número:");
    placeComplement = inputUser("Informe o complemento:");
    placeDistrict = inputUser("Informe o bairro:");
    _placeZipCode = inputUser("Informe o CEP:");
    placeState = inputUser("Informe a UF:");
    
  }
}
