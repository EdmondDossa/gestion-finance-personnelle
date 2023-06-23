import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:hive_flutter/hive_flutter.dart';

initDatabase() async {
  Hive.registerAdapter(HAvoirsAdapter());
  await Hive.openBox<HAvoirs>("Avoirs");

  Hive.registerAdapter(HDettesAdapter());
  await Hive.openBox<HDettes>("Dettes");

  Hive.registerAdapter(HRealisationsAdapter());
  await Hive.openBox<HRealisations>("Realisations");

  Hive.registerAdapter(HLignesPrevisionsAdapter());
  await Hive.openBox<HLignesPrevisions>("LignesPrevisions");

  Hive.registerAdapter(HPretsAdapter());
  await Hive.openBox<HPrets>("Prets");

  Hive.registerAdapter(HRubriquesAdapter());
  await Hive.openBox<HRubriques>("Rubriques");

  Hive.registerAdapter(HPrevisionsAdapter());
  await Hive.openBox<HPrevisions>("Previsions");
}
