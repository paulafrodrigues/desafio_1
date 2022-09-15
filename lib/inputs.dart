import 'dart:convert';
import 'dart:io';

String inputUser(String text) {
  print(text);
  final dataRegistration = stdin.readLineSync(encoding: utf8)!;
  return dataRegistration;
}


