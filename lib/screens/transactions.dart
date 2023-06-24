import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/previsions.dart';
import 'package:gestion_finance/screens/realisations.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';
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
  int _index = 0;
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
              decoration: BoxDecoration(
                color: white.withOpacity(0.85),
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
                        "20000 FCFA",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showModal(),
                      child: Container(
                        width: 150,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "$_month, $_year",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: white.withOpacity(0.65),
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
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, left: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mes réalisations",
                      style: TextStyle(
                          fontSize: 20,
                          color: mainFontColor,
                          fontWeight: FontWeight.bold)),
                  Text("Tout voir",
                      style: TextStyle(
                        fontSize: 13,
                        color: mainFontColor,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeIndex(3);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: _index == 3 ? buttonColor : white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "Dettes",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 3
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
                          changeIndex(4);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: _index == 4 ? buttonColor : white,
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
                              "Prêts",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 4
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Aujourd'hui",
                    style: TextStyle(
                      fontSize: 20,
                      color: mainFontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Loyer",
              description: "",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Manger",
              description: "",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Transport",
              description: "",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Shopping",
              description: "Montant pour mon habillement",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Payment",
              description: "Payment from Andrea",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Sante",
              description: "La santé avant tout",
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(
                Icons.payment,
                color: mainFontColor,
              ),
              title: "Dettes",
              description: "Mes dettes envers Arlette",
              amount: 400,
              amountColor: red,
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
    final List<String> years = ['2022', '2023', '2024', '2025', '2026'];

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
          SizedBox(
            width: 30,
          ),
          Expanded(
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
        ],
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
                                builder: (context) => CreatePrevisionPage(month: _month,year: _year,)),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red[600]),
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
                                builder: (context) => CreateRealisationPage()),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: green),
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
        return _showSelectedMonthModal();
      },
    );
  }

  changeIndex(index) {
    setState(() {
      _index = index;
    });
  }
}
