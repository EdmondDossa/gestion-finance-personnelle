import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int? numberOfDays;
  int jour_utiliser = DateTime.now().day;
  double? point;
  int? _prevsion;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _prevsion = getPrevisionKey(capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now())), DateFormat("yyyy").format(DateTime.now()));
    numberOfDays = getNumberOfDaysInMonth(year, month);
    prevision = totalDepensePrevision(_prevsion);
    realisation = totalDepenseRealisation(capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now())),DateFormat("yyyy").format(DateTime.now()));
    //percent = (realisation! * 100) / prevision!;
    reste_prevision = prevision! - realisation!;
    prorata = (prevision! / numberOfDays!) * jour_utiliser;
    point = prorata! - realisation!;
  }

  int getNumberOfDaysInMonth(int year, int month) {
    // Créez une instance de DateTime pour le premier jour du mois suivant avec l'année et le mois spécifiés.
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    // Soustrayez un jour de la date du premier jour du mois suivant pour obtenir le dernier jour du mois actuel.
    DateTime lastDayOfMonth = firstDayOfNextMonth.subtract(Duration(days: 1));
    // Renvoie le jour du mois pour le dernier jour du mois actuel.
    return lastDayOfMonth.day;
  }

  //StatisticsPage({required this.realisation, required this.prevision});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
                        style: TextStyle(fontSize: 18),
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
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Marge restant : ${(prevision! - realisation!).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex:2,
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
                        child:Text(
                        "Attention!! Vous êtes en déficit",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: red),
                      )
                      )
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
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
