import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/screens/configuration.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");
  TextEditingController _confirmPassword = TextEditingController(text: "");
  TextEditingController _username = TextEditingController(text: "");
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _haveError = false;
  bool _isDifferent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Adresse électronique (Email)",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                TextField(
                  controller: _email,
                  cursorColor: black,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "aboka@gmail.com",
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: black,
                  ),
                )
              ],
            ),
          ),
          if (_haveError)
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Email incorrect",
                style: TextStyle(
                    fontSize: 13, color: red, fontWeight: FontWeight.w500),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Nom de l'utilisateur",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                TextField(
                  controller: _username,
                  cursorColor: black,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Aboka21",
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    prefixIconColor: black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white,
                border: Border.all(
                  // ignore: dead_code
                  color: _isDifferent ? red : white,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Mot de passe",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                TextField(
                  obscureText: _obscureText,
                  controller: _password,
                  cursorColor: black,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "********",
                      prefixIcon: const Icon(Icons.lock_clock_outlined),
                      prefixIconColor: black,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: black,
                          ))),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: white,
                border: Border.all(
                  // ignore: dead_code
                  color: _isDifferent ? red : white,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Confirmer le mot de passe",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                TextField(
                  obscureText: _obscureText1,
                  controller: _confirmPassword,
                  cursorColor: black,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "********",
                      prefixIcon: const Icon(Icons.lock_clock_outlined),
                      prefixIconColor: black,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(
                            _obscureText1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: black,
                          ))),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              if (_confirmPassword.text != _password.text) {
                setState(() {
                  _isDifferent = true;
                });
              } else {
                var auth = await authServices.signUp(
                    _email.text, _password.text, _username.text);
                if (!auth) {
                  setState(() {
                    _haveError = true;
                    _isDifferent = false;
                  });
                } else {
                  await rubriquesBox.add(HRubriques("Dettes", "Rubriques concernant mes emprunts"));
                  await rubriquesBox.add(HRubriques("Prêts", "Rubriques concernant mes prêts à autrui"));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfigurationPage(),
                      ));
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  "Créer votre compte",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "J'ai un compte!!!",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: grey),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(
                              color: blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
