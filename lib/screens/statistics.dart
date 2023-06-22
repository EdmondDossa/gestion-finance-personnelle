import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:fl_chart/fl_chart.dart';


class StattisticsPage extends StatefulWidget {
  const StattisticsPage({super.key});

  @override
  State<StattisticsPage> createState() => _StattisticsPageState();
}

class _StattisticsPageState extends State<StattisticsPage> {
   final double income = 5000;
  final double expenses = 3000;
  //StatisticsPage({required this.income, required this.expenses});
  List days = ["Jour","Semaine","Mois","Annee"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Statistiques",
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
            children: [
              ...List.generate(4, (index) {
                return Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: buttonColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                      days[index],
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: income,
                      title: 'Revenus',
                      radius: 70,
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: expenses,
                      title: 'Dépenses',
                      radius: 70,
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Revenus du mois: ${income.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Dépenses du mois: ${expenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Solde: ${(income - expenses).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ],
      ),
    ));
  }
}

/* 
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsPage extends StatelessWidget {
  final double income;
  final double expenses;

  StatisticsPage({required this.income, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiques'),
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: income,
                      title: 'Revenus',
                      radius: 70,
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: expenses,
                      title: 'Dépenses',
                      radius: 70,
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Revenus du mois: ${income.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Dépenses du mois: ${expenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Solde: ${(income - expenses).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des finances personnelles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatisticsPage(income: 5000.0, expenses: 3000.0),
    );
  }
}
 */
