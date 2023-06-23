import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive%20Models/rubriques.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/models/transaction.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';
import 'package:hive/hive.dart';

class AllRubriques extends StatefulWidget {
  const AllRubriques({super.key});

  @override
  State<AllRubriques> createState() => _AllRubriquesState();
}

class _AllRubriquesState extends State<AllRubriques> {
  TextEditingController _nomRubrique = TextEditingController();
  TextEditingController _description = TextEditingController();
  final _rubriquesBox = Hive.box<HRubriques>('Rubriques');
  List<GFRubriques> _rubriquesListe = [];
  @override
  void initState() {
    super.initState();
    _rubriquesListe = _initRubriquesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  color: buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 25,
                          color: white,
                        ),
                      ),
                      Text(
                        "Les Rubriques",
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.88,
              child: ListView(physics: BouncingScrollPhysics(), children: [
                ...List.generate(_rubriquesListe.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _selectRubrique(_rubriquesListe[index]);
                    },
                    child: WTransaction(
                      icon: Icon(Icons.money),
                      title: _rubriquesListe[index].nomRubrique,
                      description: _rubriquesListe[index].description,
                      amount: 0,
                      amountColor: white,
                    ),
                  );
                })
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: () {
          _showAddModal();
        },
        child: const Icon(Icons.add, size: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _selectRubrique(GFRubriques rubrique) {
    setState(() {
      _nomRubrique.text = rubrique.nomRubrique;
      _description.text = rubrique.description;
      _showModal(rubrique);
    });
  }

  _showModal(GFRubriques rubrique) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: white.withOpacity(0.6),
      context: context,
      builder: (_) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(children: [
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
                        "Nom Rubrique",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF67727d),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _nomRubrique,
                        cursorColor: black,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: black,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Transport"),
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
                        "description",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF67727d),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _description,
                        cursorColor: black,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: black,
                        ),
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Aboka21"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _updateRubrique(
                      rubrique.uid,
                      HRubriques(
                          _nomRubrique.text, _description.text, "00001"));
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      "Modifier",
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
          )
        ]);
      },
    );
  }

  void _refreshList() {
    final data = _rubriquesBox.keys.map((key) {
      final item = _rubriquesBox.get(key);
      return GFRubriques(item!.nomRubrique, item.description, item.userUid,
          uid: key.toString());
    }).toList();

    setState(() {
      _rubriquesListe = data;
    });
  }

  List<GFRubriques> _initRubriquesList() {
    return _rubriquesBox.keys.map((key) {
      final item = _rubriquesBox.get(key);
      return GFRubriques(item!.nomRubrique, item.description, item.userUid,
          uid: key.toString());
    }).toList();
  }

  _showAddModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: white.withOpacity(0.4),
      context: context,
      builder: (_) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    "Nom Rubrique",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _nomRubrique,
                    cursorColor: black,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Transport"),
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
                    "description",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF67727d),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _description,
                    cursorColor: black,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Aboka21"),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _createRubrique(
                  HRubriques(_nomRubrique.text, _description.text, "00001"));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  "Enrégistrer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }

  _createRubrique(HRubriques r) async {
    await _rubriquesBox.add(r);
    _nomRubrique.text = "";
    _description.text = "";
    _refreshList();
    Navigator.of(context).pop();
  }

  _updateRubrique(key, HRubriques r) async {
     await _rubriquesBox.put(key, r);
    _nomRubrique.text = "";
    _description.text = "";
    _refreshList();
    Navigator.of(context).pop();
  }
}
