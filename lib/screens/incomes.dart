import 'package:flutter/material.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreateIncome extends StatefulWidget {
  const CreateIncome({super.key});

  @override
  State<CreateIncome> createState() => _CreateIncomeState();
}

class _CreateIncomeState extends State<CreateIncome> {
  TextEditingController _nameIncomes = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.cancel_outlined,
                  size: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                        //color: Color(0xFF21ca79),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Color.fromARGB(255, 146, 146, 146),
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_outlined,
                        ),
                        Text("Revenu"),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.delete,
                  size: 30,
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
                  "Titre du revenu",
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
              onTap: () {},
              child: Wrap(children: [
                Container(
                  //width: (MediaQuery.of(context).size.width) * 0.6,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.food_bank_outlined,
                        color: white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Renseigner la source",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              //width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 146, 146, 146),
                    width: 1,
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.list_outlined),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _description,
                    cursorColor: black,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                    //textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Une description",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 146, 146, 146),
                    width: 1,
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          Text(
                            "Date de création",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextField(
                    controller: _date,
                    cursorColor: black,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                    //textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "20/06/2023",
                    ),
                  ),
                ],
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
            )
          ],
        ),
      ),
    );
  }
}
