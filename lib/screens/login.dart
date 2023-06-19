import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/utilities/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 200),
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
                    "Email Address",
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
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:10),
            child: Text(
              "Email incorrect",
              style: TextStyle(
                fontSize: 13,
                color: red,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(
            height: 40,
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
                    "Password",
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
                  keyboardType: TextInputType.text,
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
                          color: black,))),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:10),
            child: Text(
              "mot de passe incorrect",
              style: TextStyle(
                fontSize: 13,
                color: red,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomePage())
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  "Login",
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "I haven't account!!!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            color: blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ))
                  ],
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
