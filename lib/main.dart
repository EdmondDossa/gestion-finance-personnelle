import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        scaffoldBackgroundColor: Color(0xFF1C2833),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LoginPage()
    );
  }
}
