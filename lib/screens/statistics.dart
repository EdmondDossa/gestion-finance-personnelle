import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/realisations.dart';
import 'package:gestion_finance/screens/previsions.dart';
import 'package:gestion_finance/screens/realisations.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:intl/intl.dart';

class StattisticsPage extends StatefulWidget {
  const StattisticsPage({super.key});

  @override
  State<StattisticsPage> createState() => _StattisticsPageState();
}

class _StattisticsPageState extends State<StattisticsPage> {
  double? realisation;
  double? prevision;
  double? percent;
  double? prorata;
  double? reste_prevision;
  /* int year = DateTime.now().year;
  int month = DateTime.now().month; */
  String _month =
      capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now()));
  String _year = DateFormat("yyyy").format(DateTime.now());
  int? numberOfDays;
  int jour_utiliser = DateTime.now().day;
  double? point;
  int? _prevision;
  int _tab = 0;
  List<GFLignesPrevisions> _transactionsList = [];
  List<GFRealisation?> _realisationsList = [];
  int _index = 0;
  double _marge = 0;
  int _monthOrYear = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
    _prevision = getPrevisionKey(
        capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now())),
        DateFormat("yyyy").format(DateTime.now()));
    numberOfDays = getNumberOfDaysInMonth(_month, _year);
    prevision = totalDepensePrevision(_prevision);
    realisation = totalDepenseRealisation(
        capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now())),
        DateFormat("yyyy").format(DateTime.now()));
    //percent = (realisation! * 100) / prevision!;
    reste_prevision = prevision! - realisation!;
    prorata = (prevision! / numberOfDays!) * jour_utiliser;
    point = prorata! - realisation!;
  }

  int getNumberOfDaysInMonth(String month, String year) {
    int? parsedMonth = int.tryParse(month);
    int? parsedYear = int.tryParse(year);

    if (parsedMonth != null && parsedYear != null) {
      return DateTime(parsedYear, parsedMonth).day;
    } else {
      return 0;
    }
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

  //StatisticsPage({required this.realisation, required this.prevision});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            //width: double.infinity,
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                    child: Text(
                      _marge != 0 ? "$_marge FCFA" : "0 FCFA",
                      style: TextStyle(
                          fontSize: 14,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 7),
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: black,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 7),
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: black,
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
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Statistiques du mois",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: PieChart(
                  PieChartData(
                    sections: [
                      if (reste_prevision! > 0)
                        PieChartSectionData(
                          color: Colors.green,
                          value: reste_prevision,
                          title: '',
                          radius: 70,
                        ),
                      PieChartSectionData(
                        color: Colors.red,
                        value: realisation,
                        title: '',
                        radius: 70,
                      ),
                    ],
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.square,
                      color: red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Réalisations réalisés: ${realisation!.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.square,
                      color: green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Prévisions prévus: ${prevision!.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Avis :",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                    ),
                    if (point! < 0)
                      Expanded(
                          flex: 8,
                          child: Text(
                            "Attention!! Vous êtes en déficit",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: red),
                          ))
                    else if (point! == 0)
                      Expanded(
                        flex: 8,
                        child: Text(
                          "Vous avez atteint votre seuil!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 129, 117, 9)),
                        ),
                      )
                    else if (point! > 0)
                      Expanded(
                        flex: 8,
                        child: Text(
                          "Courage vous êtes en bonne voie!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: green),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
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
}
