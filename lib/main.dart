import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/screens/login.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
        }
      ),
    );
  }
}
