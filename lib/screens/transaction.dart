import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Text(
                        "\$20000",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Septembre",
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
                                color: grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Icon(Icons.chevron_right, color: white,),
                            ),)
                        ],
                      ),
                    )
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
                  Text("Mes transactions",
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
                                color: _index == 0 ? white : black.withOpacity(0.5),
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
                              "Revenus",
                              style: TextStyle(
                                fontSize: 13,
                                color: _index == 1 ? white :black.withOpacity(0.5),
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
                                color: _index == 2 ? white : black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
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
                                color: _index == 3 ? white : black.withOpacity(0.5),
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
                                color: _index == 4 ? white :black.withOpacity(0.5),
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
    );
  }

  changeIndex(index) {
    setState(() {
      _index = index;
    });
  }
}
