import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/add_rubriques.dart';
import 'package:gestion_finance/screens/realisations.dart';
import 'package:gestion_finance/screens/home_page.dart';
import 'package:gestion_finance/screens/parametre.dart';
import 'package:gestion_finance/screens/previsions.dart';
import 'package:gestion_finance/screens/statistics.dart';
import 'package:gestion_finance/screens/transactions.dart';
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

  
  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
