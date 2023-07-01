import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/home_page.dart';
import 'package:gestion_finance/screens/profil.dart';
import 'package:gestion_finance/screens/statistics.dart';
import 'package:gestion_finance/screens/transactions.dart';
import 'package:gestion_finance/utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.indexPage});

  final int? indexPage;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    const StartPage(),
    const TransactionPage(),
    const StattisticsPage(),
    const ProfilPage(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.indexPage == null) {
      pageIndex = 0;
    } else {
      pageIndex = widget.indexPage!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: primary,
          body: getBody(),
          bottomNavigationBar: getFooter(),
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
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setTabs(0);
              },
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.home,
                    size: 25,
                    color: pageIndex == 0 ? blue : white,
                  ),
                  Text(
                    "Accueil",
                    style: TextStyle(
                        fontSize: 14,
                        color: pageIndex == 0 ? blue : white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setTabs(1);
              },
              child: Column(
                children: [
                  Icon(CupertinoIcons.creditcard,size: 25,
                    color: pageIndex == 1 ? blue : white,),
                  Text(
                    "Transactions",
                    style: TextStyle(
                        fontSize: 14,
                        color: pageIndex == 1 ? blue : white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setTabs(2);
              },
              child: Column(
                children: [
                  Icon(Icons.stadium,size: 25,
                    color: pageIndex == 2 ? blue : white,),
                  Text(
                    "Statistiques",
                    style: TextStyle(
                        fontSize: 14,
                        color: pageIndex == 2 ? blue : white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setTabs(3);
              },
              child: Column(
                children: [
                  Icon(CupertinoIcons.person,size: 25,
                    color: pageIndex == 3 ? blue : white,),
                  Text(
                    "Profil",
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
    );
    /*List<IconData> iconItems = [
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
      gapLocation: GapLocation.none,
      activeIndex: pageIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 18,
      rightCornerRadius: 18,
      iconSize: 25,
      activeColor: blue,
      elevation: 0,
    );*/
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
