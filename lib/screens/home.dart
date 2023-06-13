import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/daily.dart';
import 'package:gestion_finance/screens/transaction.dart';
import 'package:gestion_finance/utilities/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pages = [
    const DailyPage(),
    const TransactionPage(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: primary,
          body: getBody(),
          bottomNavigationBar: getFooter(),
          floatingActionButton: SafeArea(
              child: FloatingActionButton(
            backgroundColor: buttonColor,
            onPressed: () {},
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
      CupertinoIcons.money_dollar,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
      onTap: (index) {
        setTabs(index);
      },
      backgroundColor: Color(0xFF1C2833).withOpacity(0.4),
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
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
