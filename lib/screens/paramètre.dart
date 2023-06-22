import 'package:flutter/material.dart';
import 'package:gestion_finance/utilities/auth_services.dart';

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
              height: 300,
              //decoration: BoxDecoration(color: grey),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 35),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  openDrawer(context);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Arlette",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: white),
                                    ),
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
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Paramètres",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
          ]),
        ],
      ),
    ));
  }

  void openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.8),
                ),
              ),
              ListTile(
                leading: Icon(Icons.category_outlined),
                title: Text('Rubriques'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Se Déconnecter'),
                onTap: () {
                  Navigator.pop(context);
                  authServices.signOut();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modal de gauche à droite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal de gauche à droite'),
      ),
      body: Center(
        child: Text(
          'Appuyez sur l\'icône du menu',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              // Actions lorsque l'élément du menu est cliqué
              Navigator.pop(context); // Ferme le tiroir latéral
              // Ajoutez ici le code pour aller à la page d'accueil
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () {
              // Actions lorsque l'élément du menu est cliqué
              Navigator.pop(context); // Ferme le tiroir latéral
              // Ajoutez ici le code pour aller à la page des paramètres
            },
          ),
        ],
      ),
    );
  }
}

*/
