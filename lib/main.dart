import 'package:cupcare/Screns/login.dart';
import 'package:cupcare/Screns/machines_screen.dart';
import 'package:cupcare/Screns/products_screen.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      home: ProductScreen(),
    );
  }
}
