import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/add_rubriques.dart';
import 'package:gestion_finance/screens/expense.dart';
import 'package:gestion_finance/screens/home_page.dart';
import 'package:gestion_finance/screens/parametre.dart';
import 'package:gestion_finance/screens/revenus.dart';
import 'package:gestion_finance/screens/statistics.dart';
import 'package:gestion_finance/screens/realisation.dart';
import 'package:gestion_finance/utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    const StartPage(),
    const TransactionPage(),
    const StattisticsPage(),
    const ParametrePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: primary,
          body: getBody(),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(color: buttonColor),
            child: Column(
              children: [
                getFooter(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Accueil",
                        style: TextStyle(
                            fontSize: 14,
                            color: pageIndex == 0 ? blue : white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Réalisations",
                        style: TextStyle(
                            fontSize: 14,
                            color: pageIndex == 1 ? blue : white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Statistiques",
                        style: TextStyle(
                            fontSize: 14,
                            color: pageIndex == 2 ? blue : white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Paramètres",
                        style: TextStyle(
                            fontSize: 14,
                            color: pageIndex == 3 ? blue : white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: SafeArea(
              child: FloatingActionButton(
            backgroundColor: buttonColor,
            onPressed: () {
              showModal(pageIndex);
            },
            child: const Icon(Icons.add, size: 20),
          )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
        onWillPop: () async {
          if (pageIndex != 0) {
            setTabs(0);
            return false;
          } else {
            return true;
          }
        });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.creditcard,
      Icons.stadium,
      CupertinoIcons.settings,
    ];
    return AnimatedBottomNavigationBar(
      onTap: (index) {
        setTabs(index);
      },
      backgroundColor: buttonColor,
      icons: iconItems,
      splashColor: white,
      inactiveColor: white,
      gapLocation: GapLocation.center,
      activeIndex: pageIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 18,
      rightCornerRadius: 18,
      iconSize: 25,
      activeColor: blue,
      elevation: 0,
    );
  }

  showModal(int index) {
    showModalBottomSheet(
        context: context,
        backgroundColor: white.withOpacity(0.4),
        elevation: 5,
        isScrollControlled: true,
        builder: (_) {
          if (index == 0 || index == 1 || index == 2) {
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
                                builder: (context) => CreateIncomePage()),
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
                                builder: (context) => CreateExpansePage()),
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
          }
          
          return widget;
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
