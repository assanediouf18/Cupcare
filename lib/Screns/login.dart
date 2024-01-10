import 'package:cupcare/Components/authentication_form.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_CupCare.png'),
            SizedBox(height: 30),
            AuthenticationForm(showRegisterForm: false)
          ],
        ),
      ),
    );
  }
}
