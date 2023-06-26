import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/realisations.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:intl/intl.dart';

//Fonction pour récupérer toutes les rubriques

List<GFRubriques> getAllRubriques() {
  return rubriquesBox.keys.map((key) {
    final item = rubriquesBox.getAt(key);
    return GFRubriques(item!.nomRubrique, item.description, item.userUid,
        uid: key);
  }).toList();
}

List<GFRubriques?> getAllRubriquesRecettes(int id) {
  final lignesPrevisions = getAllLignesPrevisions(id);
  final previsionRecette = lignesPrevisions.where((lp) => lp.type == "Recette");
  final rubriques = getAllRubriques();

  final recetteRubriques = rubriques.map((ru) {
    /* final result =[]; */
    for (var l in previsionRecette) {
      if (l.source == ru.uid) {
        return ru;
      }
    }
  });

  return recetteRubriques.toList();
}

GFRubriques getRubrique(int index) {
  final item = rubriquesBox.getAt(index);
  return GFRubriques(item!.nomRubrique, item.description, item.userUid,
      uid: index);
}

GFLignesPrevisions getLignesPrevisions(index) {
  final item = lignesPrevisionsBox.getAt(index);
  return GFLignesPrevisions(
      type: item!.type,
      montant: item.montant,
      rubrique: item.rubrique,
      prevision: item.prevision);
}

List<GFLignesPrevisions> getAllPrevisionsRecettes() {
  final ligne = lignesPrevisionsBox.keys.map((key) {
    final item = lignesPrevisionsBox.getAt(key);
    return GFLignesPrevisions(
        type: item!.type,
        montant: item.montant,
        rubrique: item.rubrique,
        description: item.description,
        prevision: item.prevision);
  }).toList();
  return ligne.where((lp) => lp.type == "Recette").toList();
}

List<GFLignesPrevisions> getAllPrevisionsDepense() {
  final ligne = lignesPrevisionsBox.keys.map((key) {
    final item = lignesPrevisionsBox.getAt(key);
    return GFLignesPrevisions(
        type: item!.type,
        montant: item.montant,
        rubrique: item.rubrique,
        description: item.description,
        prevision: item.prevision);
  }).toList();
  return ligne.where((lp) => lp.type == "Depense").toList();
}

//Fonction pour sauvegarder une prévision
Future<bool> savePrevision(month, year) async {
  try {
    await previsionsBox.add(HPrevisions(month, year));
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
int getPrevisionKey(month, year) {
  final listPrevisions = previsionsBox.keys.map((key) {
    final item = previsionsBox.getAt(key);
    return GFPrevisions(item!.userUid, item.mois, item.annee, uid: key);
  }).toList();

  final filteredPrevision = listPrevisions
      .where((prevision) => prevision.mois == month && prevision.annee == year)
      .toList();

  if (filteredPrevision.length == 0) {
    return -1;
  } else {
    return filteredPrevision[0].uid!;
  }
}

List<GFLignesPrevisions> getAllLignesPrevisions(int? idprevision) {
  final ligne = lignesPrevisionsBox.keys.map((key) {
    final item = lignesPrevisionsBox.getAt(key);
    return GFLignesPrevisions(
        type: item!.type,
        montant: item.montant,
        rubrique: item.rubrique,
        prevision: item.prevision);
  }).toList();
  return ligne.where((lp) => lp.prevision == idprevision).toList();
}

Future<bool> saveLignesPrevisions(GFLignesPrevisions lignesPrevisions) async {
  try {
    await lignesPrevisionsBox.add(HLignesPrevisions(
        lignesPrevisions.type,
        lignesPrevisions.montant,
        lignesPrevisions.prevision,
        lignesPrevisions.description,
        lignesPrevisions.rubrique));
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

List<GFRealisation> getAllMonthRealiation() {
  return realisationsBox.keys.map((key) {
    final item = realisationsBox.getAt(key);
    return GFRealisation(
        type: item!.type,
        source: item.source,
        montant: item.montant,
        date: item.date,
        description: item.description,
        rubriquesUid: item.rubrique,
        uid: key);
  }).toList();
}

List<GFRealisation> getAllRealisationRecettes() {
  final ligne = getAllMonthRealiation();
  return ligne.where((lp) => lp.type == "Recette").toList();
}

List<GFRealisation> getAllRealisationDepense() {
  final ligne = getAllMonthRealiation();
  return ligne.where((lp) => lp.type == "Depense").toList();
}

double totalRecettePrevision() {
  var list = getAllPrevisionsRecettes();
  double montant = 0;
  for (var l in list) {
    montant = montant + l.montant!;
  }
  return montant;
}

double totalDepenseRealisation() {
  var list = getAllRealisationDepense();
  double montant = 0;
  for (var l in list) {
    montant = montant + l.montant!;
  }
  return montant;
}

double totalRecettesRealisation() {
  var list = getAllRealisationRecettes();
  double montant = 0;
  for (var l in list) {
    montant = montant + l.montant!;
  }
  return montant;
}

double totalDepensePrevision() {
  var list = getAllPrevisionsDepense();
  double montant = 0;
  for (var l in list) {
    montant = montant + l.montant!;
  }
  return montant;
}
