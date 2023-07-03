import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/realisations.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/screens/previsions.dart';
import 'package:gestion_finance/screens/realisations.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:gestion_finance/widgets/prevision-widget.dart';
import 'package:gestion_finance/widgets/realisation-widget.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  String _month =
      capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now()));
  String _year = DateFormat("yyyy").format(DateTime.now());
  int _tab = 0;
  List<GFLignesPrevisions> _transactionsList = [];
  List<GFRealisation?> _realisationsList = [];
  int? _prevision;
  int _index = 0;
  double _marge = 0;
  int _monthOrYear = 0;
  @override
  void initState() {
    super.initState();

    _refresh();
  }

  _refresh() {
    _prevision = getPrevisionKey(_month, _year);
    _marge = totalDepensePrevision(_prevision) -
        totalDepenseRealisation(_month, _year);
    if (_tab == 0) {
      setState(() {
        _transactionsList = getAllLignesPrevisions(_prevision);
      });
    } else {
      setState(() {
        _realisationsList = getAllMonthRealiation(_month, _year);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3)
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        _marge != 0 ? "$_marge FCFA" : "0 FCFA",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _monthOrYear = 0;
                            });
                            _showModal();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 7),
                            decoration: BoxDecoration(
                                color: white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "$_month",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _monthOrYear = 1;
                            });
                            _showModal();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 7),
                            decoration: BoxDecoration(
                                color: white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "$_year",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, left: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _tab = 0;
                        if (_index == 0) {
                          _refresh();
                        }
                        if (_index == 1) {
                          _transactionsList =
                              getAllPrevisionsRecettes(_prevision);
                        }
                        if (_index == 2) {
                          _transactionsList =
                              getAllPrevisionsDepense(_prevision);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: _tab == 0 ? buttonColor : primary,
                                  width: 2))),
                      child: Text("Prévisions",
                          style: TextStyle(
                              fontSize: 20,
                              color: _tab == 0 ? mainFontColor : black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _tab = 1;
                        if (_index == 0) {
                          _refresh();
                        }
                        if (_index == 1) {
                          _realisationsList =
                              getAllRealisationRecettes(_month, _year);
                        }
                        if (_index == 2) {
                          _realisationsList =
                              getAllRealisationDepense(_month, _year);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: _tab == 1 ? buttonColor : white,
                                  width: 2))),
                      child: Text("Réalisations",
                          style: TextStyle(
                            fontSize: 20,
                            color: _tab == 1 ? mainFontColor : black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20, left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeIndex(0);
                          _refresh();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: _index == 0 ? buttonColor : white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "Tout",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 0
                                    ? white
                                    : black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeIndex(1);
                          setState(() {
                            if (_tab == 0) {
                              _transactionsList =
                                  getAllPrevisionsRecettes(_prevision);
                            } else {
                              _realisationsList =
                                  getAllRealisationRecettes(_month, _year);
                            }
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: _index == 1 ? buttonColor : white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                )
                              ]),
                          child: Center(
                            child: Text(
                              "Recettes",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 1
                                    ? white
                                    : black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeIndex(2);
                          setState(() {
                            if (_tab == 0) {
                              _transactionsList =
                                  getAllPrevisionsDepense(_prevision);
                            } else {
                              _realisationsList =
                                  getAllRealisationDepense(_month, _year);
                            }
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: _index == 2 ? buttonColor : white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.03),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                )
                              ]),
                          child: Center(
                            child: Text(
                              "Dépenses",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 2
                                    ? white
                                    : black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(physics: BouncingScrollPhysics(), children: [
                if (_tab == 0)
                  ...List.generate(_transactionsList.length, (index) {
                    var rubrique =
                        getRubrique(_transactionsList[index].rubrique!);
                    var description;
                    if (_transactionsList[index].description != null) {
                      description = _transactionsList[index].description;
                    } else {
                      description = "";
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePrevisionPage(
                                      month: _month,
                                      year: _year,
                                      ligneP: _transactionsList[index],
                                    )));
                      },
                      child: WPrevision(
                        icon: Icon(Icons.payment),
                        rubrique: rubrique,
                        description: description,
                        amount: _transactionsList[index].montant,
                        amountColor: _transactionsList[index].type == "Depense"
                            ? red
                            : green,
                        operation: _transactionsList[index].type == "Depense"
                            ? Icon(
                                Icons.arrow_upward_outlined,
                                color: red,
                                size: 18,
                              )
                            : Icon(
                                Icons.arrow_downward_outlined,
                                color: green,
                                size: 18,
                              ),
                      ),
                    );
                  }),
                if (_tab == 1)
                  ...List.generate(_realisationsList.length, (index) {
                    var rubrique = getRubrique(index);
                    var source;
                    if (_realisationsList[index]?.source != null) {
                      source = getRubrique(_realisationsList[index]!.source!);
                    } else {
                      source = GFRubriques("", "", "");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: WRealisation(
                        icon: Icon(Icons.payment),
                        rubrique: rubrique,
                        description: _realisationsList[index]!.description!,
                        amount: _realisationsList[index]?.montant,
                        date: _realisationsList[index]?.date,
                        amountColor: _realisationsList[index]?.type == "Depense"
                            ? red
                            : green,
                        source: source,
                        operation: _realisationsList[index]?.type == "Depense"
                            ? Icon(
                                Icons.arrow_upward_outlined,
                                color: red,
                                size: 18,
                              )
                            : Icon(
                                Icons.arrow_downward_outlined,
                                color: green,
                                size: 18,
                              ),
                      ),
                    );
                  }),
                SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: SafeArea(
          child: FloatingActionButton(
        backgroundColor: buttonColor.withOpacity(0.80),
        onPressed: () {
          showModal();
        },
        child: const Icon(Icons.add, size: 20),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _showSelectedYearModal() {
    final List<String> years = [
      '2022',
      '2023',
      '2024',
      '2025',
      '2026',
      '2027',
      '2028',
      '2029',
      '2030'
    ];
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: 250,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: years.length,
          itemBuilder: (BuildContext context, int index) {
            String year = years[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _year = year;
                  _prevision = getPrevisionKey(_month, _year);
                  _marge = totalDepensePrevision(_prevision) -
                      totalDepenseRealisation(_month, _year);
                  if (_tab == 0) {
                    if (_index == 0) {
                      _refresh();
                    }
                    if (_index == 1) {
                      _transactionsList = getAllPrevisionsRecettes(_prevision);
                    }
                    if (_index == 2) {
                      _transactionsList = getAllPrevisionsDepense(_prevision);
                    }
                  } else {
                    if (_index == 0) {
                      _refresh();
                    }
                    if (_index == 1) {
                      _realisationsList =
                          getAllRealisationRecettes(_month, _year);
                    }
                    if (_index == 2) {
                      _realisationsList =
                          getAllRealisationDepense(_month, _year);
                    }
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: year == _year ? blue : white,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  year,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showSelectedMonthModal() {
    final List<String> months = [
      "Janvier",
      "Fevrier",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Aout",
      "Septembre",
      "Octobre",
      "Novembre",
      "Decembre"
    ];
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: 250,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: months.length,
          itemBuilder: (context, index) {
            String month = months[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _month = month;
                  _prevision = getPrevisionKey(_month, _year);
                  _marge = totalDepensePrevision(_prevision) -
                      totalDepenseRealisation(_month, _year);
                  if (_tab == 0) {
                    if (_index == 0) {
                      _refresh();
                    }
                    if (_index == 1) {
                      _transactionsList = getAllPrevisionsRecettes(_prevision);
                    }
                    if (_index == 2) {
                      _transactionsList = getAllPrevisionsDepense(_prevision);
                    }
                  } else {
                    if (_index == 0) {
                      _refresh();
                    }
                    if (_index == 1) {
                      _realisationsList =
                          getAllRealisationRecettes(_month, _year);
                    }
                    if (_index == 2) {
                      _realisationsList =
                          getAllRealisationDepense(_month, _year);
                    }
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: _month == month ? blue : white,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  month,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  showModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: white.withOpacity(0.4),
        elevation: 5,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: 150,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 15,
              left: 15,
              right: 15,
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePrevisionPage(
                                    month: _month,
                                    year: _year,
                                  )),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: green),
                          child: Text(
                            "Prévisions",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: white),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateRealisationPage(
                                    month: _month,
                                    year: _year,
                                  )),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red[600]),
                          child: Text(
                            "Réalisation",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: white),
                          )),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  _showModal() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (_) {
          return _monthOrYear == 0
              ? _showSelectedMonthModal()
              : _showSelectedYearModal();
        });
  }

  changeIndex(index) {
    setState(() {
      _index = index;
    });
  }
}
