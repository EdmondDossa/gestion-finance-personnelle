import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/models/transaction.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:gestion_finance/utilities/db_services.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';
import 'package:intl/intl.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  //String _selectedMonth = DateFormat("MMMM, yyyy").format(DateTime.now());
  String _month =
      capitalizeFirstLetter(DateFormat.MMMM('fr_FR').format(DateTime.now()));
  String? _year = DateFormat("yyyy").format(DateTime.now());
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
                                  child: GestureDetector(
                                    onTap: () => authServices.signOut(),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: Icon(
                                        Icons.logout,
                                        size: 25,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 35,
                                right: 60,
                                width: 200,
                                height: 40,
                                child: GestureDetector(
                                  onTap: () => _showModal(),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 7),
                                    decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                  StreamBuilder(
                                      stream: dbServies.getUser(),
                                      builder: (_, s) {
                                        if (s.hasData) {
                                          final user = s.data![0];
                                          return Text(
                                            user.username.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: white,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: white,
                                            ),
                                          );
                                        }
                                      }),
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
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Text(
                                  "Prévisions",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                    color: white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor:
                                                green.withOpacity(0.75),
                                            child: Icon(Icons.arrow_downward,
                                                color: white, size: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Recettes",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: green.withOpacity(0.75),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor:
                                                red.withOpacity(0.75),
                                            child: Icon(Icons.arrow_upward,
                                                color: white, size: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Dépenses",
                                            style: TextStyle(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        "\$2000000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        "\$0",
                                        style: TextStyle(
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
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Text(
                                  "Réalisations",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22,
                                    color: white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor:
                                                green.withOpacity(0.75),
                                            child: Icon(Icons.arrow_downward,
                                                color: white, size: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Recettes",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: green.withOpacity(0.75),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 13,
                                            backgroundColor:
                                                red.withOpacity(0.75),
                                            child: Icon(Icons.arrow_upward,
                                                color: white, size: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Dépenses",
                                            style: TextStyle(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        "\$2000000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      child: Text(
                                        "\$0",
                                        style: TextStyle(
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
}
