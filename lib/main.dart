import 'package:cupcare/Screns/login.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseMainColor,
          secondary: baseSecondColor,
          tertiary: baseThridColor,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.salsa(),
          headlineLarge: GoogleFonts.overlock(),
          titleLarge: GoogleFonts.overlock().copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Login(),
    );
  }
}
