import 'package:flutter/cupertino.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/utilities/colors.dart';

class WPrevision extends StatefulWidget {
  const WPrevision(
      {super.key,
      this.icon,
      required this.rubrique,
      required this.description,
      this.amount,
      this.amountColor,
      this.operation});

  final Icon? icon;
  final GFRubriques rubrique;
  final String description;
  final double? amount;
  final Color? amountColor;
  final Icon? operation;
  @override
  State<WPrevision> createState() => _WPrevisionState();
}

class _WPrevisionState extends State<WPrevision> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 300,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3)
              ]),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: arrowbgColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: widget.icon,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: (size.width - 90) * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: grey.withOpacity(0.85),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  child: Text(
                                    widget.rubrique.nomRubrique,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: widget.operation,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "XOF ${widget.amount}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: widget.amountColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (widget.description != "")
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Text(
                                  widget.description,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: black.withOpacity(0.5),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        )
      ],
    );
  }
}
