import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive%20Models/rubriques.dart';
import 'package:gestion_finance/screens/all_rubriques.dart';
import 'package:gestion_finance/screens/signup.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/screens/login.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(HRubriquesAdapter());
  /* await Hive.deleteBoxFromDisk("Rubriques" ); */
  await Hive.openBox<HRubriques>("Rubriques");
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primary,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
        ),
        home: AllRubriques());
  }
}
