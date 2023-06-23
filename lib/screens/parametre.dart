import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/all_rubriques.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/db_services.dart';

import '../utilities/colors.dart';

class ParametrePage extends StatefulWidget {
  const ParametrePage({super.key});

  @override
  State<ParametrePage> createState() => _ParametrePageState();
}

class _ParametrePageState extends State<ParametrePage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  bool isModalOpen = false;

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(children: [
            Container(
              width: double.infinity,
              height: 120,
              //decoration: BoxDecoration(color: grey),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 95,
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Paramètres",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StreamBuilder(
                                    stream: dbServies.getUser(),
                                    builder: (_, s) {
                                      if (s.hasData) {
                                        final user = s.data![0];
                                        return Text(
                                          user.username.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            color: white,
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: white,
                                          ),
                                        );
                                      }
                                    }),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30),
                                        border: Border.all(color: white)),
                                    child: Icon(Icons.person_outlined,
                                        color: white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setTabs(0);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                color: buttonColor,
                              ),
                              Text(
                                "Editer",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: black),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllRubriques()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.category_outlined,
                                color: buttonColor,
                              ),
                              Text(
                                "Rubriques",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: black),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setTabs(2);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: buttonColor,
                              ),
                              Text(
                                "Déconnection",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: black),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    ));
  }

  _showModal(index) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        backgroundColor: white.withOpacity(0.4),
        builder: (_) {
          if (index == 0) {
            return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text(
                            "Modifier vos informations",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          } else if (index == 2) {
            authServices.signOut();
          }
          return widget;
        });
  }

  setTabs(index) {
    _showModal(index);
  }
}
