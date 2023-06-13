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
                color: grey.withOpacity(0.01),
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
                    Icon(CupertinoIcons.back),
                    Icon(CupertinoIcons.search),
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
                  Text("Recent Transaction",
                      style: TextStyle(
                          fontSize: 20,
                          color: mainFontColor,
                          fontWeight: FontWeight.bold)),
                  Text("See All",
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                              fontSize: 13,
                              color: white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: white,
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
                            "Incomes",
                            style: TextStyle(
                              fontSize: 13,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: white,
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
                            "Expenses",
                            style: TextStyle(
                              fontSize: 13,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
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
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Loyer", 
              description: "", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Manger", 
              description: "", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Transport", 
              description: "", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Shopping", 
              description: "Montant pour mon habillement", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Payment", 
              description: "Payment from Andrea", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
              title: "Sante", 
              description: "La santé avant tout", 
              amount: 400,
              amountColor: red,
            ),
            WTransaction(
              icon: Icon(Icons.payment,color: mainFontColor,), 
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
}
