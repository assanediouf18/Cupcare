import 'package:cupcare/Screns/login.dart';
import 'package:cupcare/Screns/register.dart';
import 'package:cupcare/Services/authenticator.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthenticationForm extends StatefulWidget {
  final bool showRegisterForm;
  const AuthenticationForm({super.key, required this.showRegisterForm});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();

  Authenticator auth = Authenticator();
  String email = "", password = "", firstName = "", error = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildSpinner() : _buildForm(context);
  }

  Form _buildForm(BuildContext context) {
    bool showRegisterForm = widget.showRegisterForm;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          showRegisterForm
              ? CupCareFormField(
                  label: "Prénom",
                  hintText: "Samy",
                  validator: (value) => _validateFieldNotEmpty(value),
                )
              : Container(),
          SizedBox(height: 5),
          CupCareFormField(
            label: "Email",
            hintText: "Samy_le_bg_du_13@gmail.com",
            validator: (value) => _validateFieldNotEmpty(value),
            onChange: (value) => _updateEmail(value),
          ),
          SizedBox(height: 5),
          CupCareFormField(
            label: "Mot de passe",
            hintText: "Mon mdp ultra sécurisé",
            obscureText: true,
            validator: (value) {
              if (value.isEmpty || value.length < 6) {
                return "Le mot de passe doit être d'au moins 6 caractères";
              }
              return null;
            },
            onChange: (value) => _updatePassword(value),
          ),
          showRegisterForm ? SizedBox(height: 5) : SizedBox(),
          showRegisterForm
              ? CupCareFormField(
                  label: "Confirmer le mot de passe",
                  hintText: "Tellement sécurisé",
                  obscureText: true,
                  validator: (value) {
                    if (value != password) {
                      return "Les deux mots de passes sont différents";
                    }
                    return null;
                  },
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });
                dynamic result = showRegisterForm
                    ? await auth.registerWithEmailPassword(email, password)
                    : await auth.signInWithEmailPassword(email, password);
                if (result == null) {
                  setState(() {
                    isLoading = false;
                    error = "Une erreur est survenue";
                  });
                } else if (showRegisterForm) {
                  await auth.signOut();
                  redirectToLogin();
                }
              }
            },
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

  void redirectToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Widget _buildSpinner() {
    return Center(
      child: Column(children: [
        SpinKitPouringHourGlass(color: baseSecondColor),
        Text("Chargement...")
      ]),
    );
  }

  String? _validateFieldNotEmpty(String value) {
    if (value.isEmpty) return "Le champ ne peut pas être vide";
    return null;
  }

  void _updateEmail(newEmail) {
    setState(() {
      email = newEmail;
    });
    print(email);
  }

  void _updatePassword(newPwd) {
    setState(() {
      password = newPwd;
    });
  }
}

class CupCareFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final validator;
  final onChange;
  final bool obscureText;
  CupCareFormField({
    super.key,
    required this.label,
    this.hintText = "",
    this.validator,
    this.onChange,
    this.obscureText = false,
  });

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
        buildFormTextField(hintText, obscureText)
      ],
    );
  }

  Container buildFormTextField(String hintText, bool obscureText) {
    var inputDecoration = InputDecoration(
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
        ));

    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextFormField(
        decoration: inputDecoration,
        validator: validator ?? (value) => null,
        onChanged: onChange ?? (value) {},
        obscureText: obscureText,
      ),
    );
  }
}
