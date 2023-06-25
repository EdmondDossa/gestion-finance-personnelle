import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/widgets/transaction-widget.dart';
import 'package:icon_badge/icon_badge.dart';

import '../utilities/colors.dart';
class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:25,left:25, right:25,bottom: 10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20,bottom: 25,right:20,left: 20),
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.bar_chart),
                          Icon(Icons.more_vert)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/profile.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: (size.width-40)*0.6,
                            child: Column(
                              children: [
                                Text(
                                  "Aboka Jr",
                                  style:  TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: mainFontColor
                                  ),
                                ), 
                                SizedBox(height: 10,),
                                Text(
                                  "Flutter Developper",
                                  style:  TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: black
                                  ),
                                ), 
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("\$8900",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Incomes",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: black
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: 40,
                            color: black.withOpacity(0.3),
                          ),
                          Column(
                            children: [
                              Text("\$8900",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Expenses",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: black
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 0.5,
                            height: 40,
                            color: black.withOpacity(0.3),
                          ),
                          Column(
                            children: [
                              Text("\$8900",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainFontColor
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Loan",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: black
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ]
                ),
              ),
              
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: mainFontColor,
                              ),
                            ),
                            IconBadge(
                              icon: Icon(Icons.notifications_none),
                              itemCount: 5,
                              badgeColor: red,
                              itemColor: mainFontColor,
                              hideZero: true,
                              top: -1,
                              onTap: () {},
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      "June 12, 2023",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: mainFontColor,
                      ),
                    )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}