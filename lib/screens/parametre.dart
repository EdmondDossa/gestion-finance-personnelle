import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/avoirs.dart';
import 'package:gestion_finance/models/dettes.dart';
import 'package:gestion_finance/models/prets.dart';
import 'package:gestion_finance/screens/all_rubriques.dart';
import 'package:gestion_finance/screens/login.dart';
import 'package:gestion_finance/screens/notification.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/db_services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utilities/colors.dart';

class ParametrePage extends StatefulWidget {
  const ParametrePage({super.key});

  @override
  State<ParametrePage> createState() => _ParametrePageState();
}

class _ParametrePageState extends State<ParametrePage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  var _avoir;
  var _dette;
  var _pret;
  bool isModalOpen = false;

  _getConfig() async {
    final dataAvoirs = avoirsBox.keys.map((key) {
      final item = avoirsBox.get(key);

      return GFAvoirs(item!.capital);
    }).toList();

    final dataDettes = dettesBox.keys.map((key) {
      final item = dettesBox.get(key);

      return GFDettes(montantTotal: item!.montant);
    }).toList();

    final dataPrets = pretsBox.keys.map((key) {
      final item = pretsBox.get(key);

      return GFPrets(montantTotal: item!.montant);
    }).toList();

    setState(() {
      if (dataAvoirs.length != 0) {
        _avoir = dataAvoirs[0];
      }
      if (dataDettes.length != 0) {
        _dette = dataDettes[0];
      }
      if (dataPrets.length != 0) {
        _pret = dataPrets[0];
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getConfig();
  }

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
              height: 300,
              //decoration: BoxDecoration(color: grey),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: white)),
                                    child: Icon(Icons.person_outlined,
                                        color: white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Avoirs: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                              Text(
                                _avoir != null
                                    ? _avoir!.capital.toString() + " FCFA"
                                    : "0 FCFA",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Dettes: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                              Text(
                                _dette != null
                                    ? _dette!.montantTotal.toString() + " FCFA"
                                    : "0 FCFA",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "Prêts: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                              Text(
                                _pret != null
                                    ? _pret!.montantTotal.toString() + " FCFA"
                                    : "0 FCFA",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              )
                            ],
                          ),
                        )
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
                      /*  GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.notification_add_outlined,
                                color: buttonColor,
                              ),
                              Text(
                                "Notification",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: black),
                              )
                            ],
                          ),
                        ),
                      ), */
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
          }
          return widget;
        });
  }

  setTabs(index) {
    _showModal(index);
  }
}
