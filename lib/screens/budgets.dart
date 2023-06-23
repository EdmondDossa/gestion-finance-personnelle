import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({super.key});

  @override
  State<CreateBudgetPage> createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  TextEditingController _amount = TextEditingController();
  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: grey, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.close,
                      size: 25,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                        color: buttonColor.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: buttonColor.withOpacity(0.75),
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.money_outlined,
                          color: white,
                        ),
                        Text(
                          "Budget",
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: grey, width: 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Enregistrer un budget",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: grey.withOpacity(0.9),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 146, 146, 146),
                        width: 1,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //Icon(Icons.calendar_month_outlined),
                          Text(
                            "Année",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('yyyy').format(_date),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 146, 146, 146),
                        width: 1,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //Icon(Icons.calendar_month_outlined),
                          Text(
                            "Mois",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('MMMM ').format(_date),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Entrez le montant",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    TextField(
                      controller: _amount,
                      cursorColor: black,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "800 XOF",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Color.fromARGB(255, 146, 146, 146),
                              width: 1,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.save,
                              color: white,
                            ),
                            Text(
                              "Enregistrer",
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
