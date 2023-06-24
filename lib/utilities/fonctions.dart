import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/rubriques.dart';

//Fonction pour récupérer toutes les rubriques

List<GFRubriques> getAllRubriques() {
  return rubriquesBox.keys.map((key) {
    final item = rubriquesBox.get(key);
    return GFRubriques(item!.nomRubrique, item.description, item.userUid,
        uid: key);
  }).toList();
}

//Fonction pour sauvegarder une prévision

bool savePrevision(month, year) {
  try {
    previsionsBox.add(HPrevisions(month, year));
    return true;
  } catch (e) {
    return false;
  }
}

//Fonction pour récupérer toutes les prévisions
List<GFPrevisions> getAllPrevisions() {
  return previsionsBox.keys.map((key) {
    final item = previsionsBox.getAt(key);
    return GFPrevisions(item!.userUid, item.mois, item.annee, uid: key);
  }).toList();
}

//Fonction pour récupérer l'identifiant d'une prevision si celui ci existe
int? getPrevisionKey(month, year) {
  final listPrevisions = getAllPrevisions();
  final filteredPrevision = listPrevisions
      .where((prevision) => prevision.mois == month && prevision.annee == year)
      .toList();
  if (filteredPrevision == []) {
    return -1;
  } else {
    return filteredPrevision[0].uid;
  }
}


List<GFLignesPrevisions> getAllLignesPrevisions() {
  return lignesPrevisionsBox.keys.map((key) {
    final item = lignesPrevisionsBox.getAt(key);
    return GFLignesPrevisions(type: item!.type,montant: item.montant, rubrique: item.rubrique, prevision: item.prevision);
  }).toList();
}

bool saveLignesPrevisions(GFLignesPrevisions lignesPrevisions) {
  try {
    lignesPrevisionsBox.add(HLignesPrevisions(lignesPrevisions.type, lignesPrevisions.montant,lignesPrevisions.prevision, lignesPrevisions.rubrique));
    return true;
  } catch (e) {
    return false;
  }
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Retourne la chaîne d'entrée si elle est vide
  }

  final firstLetter = input[0].toUpperCase();
  final restOfString = input.substring(1).toLowerCase();

  return '$firstLetter$restOfString';
}
