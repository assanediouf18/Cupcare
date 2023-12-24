import 'dart:ffi';
import 'package:cupcare/color_schemes.g.dart';
import 'package:cupcare/Screns/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: baseMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_CupCare.png'),
            Text(
              'Prénom',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'NunitoSans',
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            _searchField(""),
            SizedBox(height: 5),
            Text(
              'Email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'NunitoSans',
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            _searchField(""),
            SizedBox(height: 5),
            Text(
              'Mot de passe',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'NunitoSans',
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            _searchField(""),
            SizedBox(height: 5),
            Text(
              'Confirmer le mot de passe',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'NunitoSans',
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            _searchField(""),
            SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("J'ai déjà un compte, me connecter",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "S'inscrire",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'NunitoSans',
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Container _searchField(var hintText) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(5),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
