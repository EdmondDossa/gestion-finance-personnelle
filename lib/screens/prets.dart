import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreatePretPage extends StatefulWidget {
  const CreatePretPage({super.key});

  @override
  State<CreatePretPage> createState() => _CreatePretPageState();
}

class _CreatePretPageState extends State<CreatePretPage> {
  TextEditingController _namePret = TextEditingController();
  TextEditingController _montantTotal = TextEditingController();
  TextEditingController _montantRendu = TextEditingController();
  TextEditingController _taux = TextEditingController();
  TextEditingController _beneficiaire = TextEditingController();
  TextEditingController _motif = TextEditingController();
  TextEditingController _amount = TextEditingController();
  DateTime? _dateInitial;
  DateTime? _dateFinal;

  Future<void> _selectDate(BuildContext context, date) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        date = pickedDate;
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
                          Icons.upload_outlined,
                          color: white,
                        ),
                        Text(
                          "Prêt",
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
                  "Enregistrer un prêt",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                    color: white,
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
                        controller: _namePret,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Proposer un nom",
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
                    color: white,
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
                        controller: _montantTotal,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Renseigner le montant prêter",
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
                    color: white,
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
                        controller: _montantRendu,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Renseigner le montant rendu",
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
                    color: white,
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
                        controller: _taux,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Taux",
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
                    color: white,
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
                        controller: _motif,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Motif du prêt",
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
                    color: white,
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
                        controller: _beneficiaire,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Le bénéficiaire du prêt",
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
              height: 30,
            ),
            GestureDetector(
              onTap: () => _selectDate(context, _dateInitial),
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
                          "Date de prêt",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _dateInitial != null
                          ? DateFormat('dd MMMM yyyy').format(_dateInitial!)
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
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => _selectDate(context, _dateFinal),
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
                          "Date limite",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _dateFinal != null
                          ? DateFormat('dd MMMM yyyy').format(_dateFinal!)
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
            SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
                            Icon(Icons.save),
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
