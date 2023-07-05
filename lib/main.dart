import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:gestion_finance/Hive_Models/hive_functions.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/screens/login.dart';
import 'package:gestion_finance/screens/notification.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await initDatabase();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('fr_FR', null).then((_) async {
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
      home: StreamBuilder(
          stream: authServices.onChangeUser,
          builder: (context, snapshot) {
            return snapshot.data == null ? LoginPage() : HomePage();
          }),
    );
  }
}
