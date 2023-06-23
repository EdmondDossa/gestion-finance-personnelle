import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:hive_flutter/hive_flutter.dart';

initDatabase() async {
  Hive.registerAdapter(HAvoirsAdapter());
  avoirsBox = await Hive.openBox<HAvoirs>("Avoirs");

  Hive.registerAdapter(HDettesAdapter());
  dettesBox = await Hive.openBox<HDettes>("Dettes");

  Hive.registerAdapter(HRealisationsAdapter());
  realisationsBox = await Hive.openBox<HRealisations>("Realisations");

  Hive.registerAdapter(HLignesPrevisionsAdapter());
  lignesPrevisionsBox = await Hive.openBox<HLignesPrevisions>("LignesPrevisions");

  Hive.registerAdapter(HPretsAdapter());
  pretsBox = await Hive.openBox<HPrets>("Prets");

  Hive.registerAdapter(HRubriquesAdapter());
  rubriquesBox = await Hive.openBox<HRubriques>("Rubriques");

  Hive.registerAdapter(HPrevisionsAdapter());
  previsionsBox = await Hive.openBox<HPrevisions>("Previsions");
}

