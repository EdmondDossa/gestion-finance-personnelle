import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/models/transaction.dart';
import 'package:gestion_finance/models/users.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/utilities/db_services.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List transactionsList = [
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Loyer",
      description: "",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Manger",
      description: "",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Transport",
      description: "",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Shopping",
      description: "Montant pour mon habillement",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Payment",
      description: "Payment from Andrea",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Sante",
      description: "La santé avant tout",
      amount: 400,
      amountColor: red,
    ),
    Transaction(
      icon: Icon(
        Icons.payment,
        color: mainFontColor,
      ),
      title: "Dettes",
      description: "Mes dettes envers Arlette",
      amount: 400,
      amountColor: red,
    ),
  ];
  /* Stream<List<GFUsers>> currentInfo = dbServies.getUser(); */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: buttonColor.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 30,
                                right: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.notification_add_outlined,
                                      size: 30,
                                      color: white,
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 35,
                                right: 55,
                                width: 150,
                                height: 40,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 7),
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: black.withOpacity(0.4),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 30, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Salut",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: white.withOpacity(0.65),
                                    ),
                                  ),
                                  Text(
                                    "Aboka Jr",
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    child: Container(
                      width: 320,
                      height: 230,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Montant Total",
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                    color: white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){},
                                  child: Icon(Icons.more_vert, color: white),
                                ),
                              ],
                            ),
                            
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: Text(
                              "\$20000",
                              style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: green.withOpacity(0.75),
                                        child: Icon(Icons.arrow_downward,color: white,size:15),
                                      ),
                                      SizedBox(width: 5,)
                                      ,Text(
                                        "Budgets",
                                        style:  TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: green.withOpacity(0.75),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: red.withOpacity(0.75),
                                        child: Icon(Icons.arrow_upward,color: white,size:15),
                                      ),
                                      SizedBox(width: 5,)
                                      ,Text(
                                        "Depenses",
                                        style:  TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: red.withOpacity(0.75),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                  child: Text(
                                    "\$2000000000",
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                  child: Text(
                                    "\$0",
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Récentes actions",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Tout voir",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView(physics: BouncingScrollPhysics(), children: [
                ...List.generate(transactionsList.length, (index) {
                  return WTransaction(
                    icon: transactionsList[index].icon,
                    title: transactionsList[index].title,
                    description: transactionsList[index].description,
                    amount: transactionsList[index].amount,
                    amountColor: transactionsList[index].amountColor,
                  );
                })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
