import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreateIncomePage extends StatefulWidget {
  const CreateIncomePage({super.key});

  @override
  State<CreateIncomePage> createState() => _CreateIncomePageState();
}

class _CreateIncomePageState extends State<CreateIncomePage> {
  TextEditingController _nameEspense = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _amount = TextEditingController();
  DateTime? _date;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
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
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.orange,
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.trending_up_outlined,
                          color: white,
                        ),
                        Text(
                          "Prévision",
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
                  "Faites une prévision pour un mois",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: grey.withOpacity(0.9),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 146, 146, 146),
                      width: 1,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.source_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _description,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Renseigner la source du revenu",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 146, 146, 146),
                      width: 1,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.list_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: _description,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ajouter une description",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            )),
                      ),
                    )
                  ],
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
                      //color: Colors.green,
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
                          Icon(Icons.calendar_month_outlined),
                          Text(
                            "Crée le",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        _date != null
                            ? DateFormat('dd MMMM yyyy').format(_date!)
                            : "",
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
                            color: Colors.green,
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
