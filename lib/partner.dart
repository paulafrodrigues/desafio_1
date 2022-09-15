import 'address.dart';
import 'legal_entity.dart';
import 'private_entity.dart';

abstract class Partner {
  factory Partner.addPartner(String choice) {
    if (choice == '1') {
      return PrivateEntity.addPartner();
    } else {
      return LegalEntity.addPartner();
    }
  }
  // ignore: recursive_getters
  Address get address => address;
}
