import 'package:cupcare/Screns/login.dart';
import 'package:cupcare/Screns/register.dart';
import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  final bool showRegisterForm;
  const AuthenticationForm({super.key, required this.showRegisterForm});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Form _buildForm(BuildContext context) {
    bool showRegisterForm = widget.showRegisterForm;
    return Form(
      child: Column(
        children: [
          showRegisterForm
              ? CupCareFormField(
                  label: "Prénom",
                  hintText: "Samy",
                )
              : Container(),
          SizedBox(height: 5),
          CupCareFormField(
            label: "Email",
            hintText: "Samy_le_bg_du_13@gmail.com",
          ),
          SizedBox(height: 5),
          CupCareFormField(
            label: "Mot de passe",
            hintText: "Mon mdp ultra sécurisé",
          ),
          showRegisterForm ? SizedBox(height: 5) : SizedBox(),
          showRegisterForm
              ? CupCareFormField(
                  label: "Confirmer le mot de passe",
                  hintText: "Tellement sécurisé",
                )
              : Container(),
          SizedBox(height: 10),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          showRegisterForm ? Login() : Register()),
                );
              },
              child: Text(
                  showRegisterForm
                      ? "J'ai déjà un compte, me connecter"
                      : "Je n'ai pas de compte, m'inscrire",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.underline))),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text(
              showRegisterForm ? "S'inscrire" : "Se connecter",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'NunitoSans', fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class CupCareFormField extends StatelessWidget {
  final String label;
  final String hintText;
  CupCareFormField({super.key, required this.label, this.hintText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'NunitoSans',
              color: Colors.black),
        ),
        SizedBox(height: 5),
        buildFormTextField(hintText)
      ],
    );
  }
}

Container buildFormTextField(String hintText) {
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
          contentPadding: EdgeInsets.all(12),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          )),
    ),
  );
}
