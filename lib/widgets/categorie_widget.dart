import 'package:flutter/cupertino.dart';
import 'package:gestion_finance/utilities/colors.dart';

class WCategorie extends StatefulWidget {
  const WCategorie(
      {super.key,
      required this.icon,
      required this.rubrique,
      required this.description});

  final Icon icon;
  final String rubrique;
  final String description;
  @override
  State<WCategorie> createState() => _WCategorieState();
}

class _WCategorieState extends State<WCategorie> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            child: Container(
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
              child: Row(
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
                  Expanded(
                    child: Container(
                      width: (size.width - 90) * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.rubrique,
                            style: TextStyle(
                                fontSize: 15,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.description,
                            style: TextStyle(
                                fontSize: 12,
                                color: black.withOpacity(0.5),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ))
      ],
    );
  }
}
