import 'package:gestion_finance/Hive%20Models/lignes_previsions.dart';
import 'package:hive/hive.dart';

//fonction pour enrégistrer les informations dans n'importe quel box
bool saveData(Box<dynamic> box, dynamic object) {
  try {
    box.add(object);
    return true;
  } catch (e) {
    return false;
  }
}

//fonction pour récupérer les informations de n'importe quel box
List<dynamic> allData(Box box) {
  return box.values.toList();
}

List<HLignesPrevision> allHMonthLignePrevision(
    Box<HLignesPrevision> box, String month, String annee) {
  return box.values.toList();
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Retourne la chaîne d'entrée si elle est vide
  }

  final firstLetter = input[0].toUpperCase();
  final restOfString = input.substring(1).toLowerCase();

  return '$firstLetter$restOfString';
}
