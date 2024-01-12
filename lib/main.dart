import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Model/user_model.dart';
import 'package:cupcare/Screns/home_screen.dart';
import 'package:cupcare/Screns/login.dart';
import 'package:cupcare/Services/authenticator.dart';
import 'package:cupcare/Services/database_service.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(StreamProvider<UserModel>(
    create: (context) => Authenticator().user,
    initialData:
        UserModel(email: "", firstName: "", isConnected: false, uid: ''),
    child: const MyApp(),
  ));
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
            )),
      ),
      home: Consumer<UserModel>(builder: (context, value, child) {
        if (value.isConnected) {
          return MultiProvider(
            providers: [
              StreamProvider<Iterable<ProductModel>>(
                  create: (context) => DatabaseService().getProducts(),
                  initialData: []),
              StreamProvider<Iterable<MachineModel>>(
                  create: (context) => DatabaseService().getMachines(),
                  initialData: []),
            ],
            child: HomeScreen(),
          );
        }
        return Login();
      }),
    );
  }
}
