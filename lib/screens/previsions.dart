import 'package:flutter/material.dart';
import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/screens/transactions.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:intl/intl.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreatePrevisionPage extends StatefulWidget {
  const CreatePrevisionPage({
    super.key,
    required this.month,
    required this.year,
    this.ligneP,
  });

  final String? month;
  final String? year;
  final GFLignesPrevisions? ligneP;
  @override
  State<CreatePrevisionPage> createState() => _CreatePrevisionPageState();
}

class _CreatePrevisionPageState extends State<CreatePrevisionPage> {
  TextEditingController _nameEspense = TextEditingController();
  TextEditingController _description = TextEditingController(text: "");
  TextEditingController _amount = TextEditingController();
  GFRubriques _selectRubriques =
      GFRubriques("", "", authServices.currentUser.uid);
  String _selectedType = "Recette";
  bool _edit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.ligneP != null) {
      _edit = true;
      _selectRubriques = getRubrique(widget.ligneP!.rubrique!);
      _selectedType = widget.ligneP!.type!;
      _amount.text = widget.ligneP!.montant!.toString();
      _description.text = widget.ligneP!.description!;
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
                  onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                indexPage: 1,
                              )),
                      (route) => false),
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
                  "Faites une prévision pour ce mois",
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
                decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                      color: grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: DropdownButton<String>(
                  elevation: 0,
                  underline: Container(
                    color: white, // Couleur de la bordure
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  isExpanded: true,
                  value: _selectedType,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                  items: <String>['Recette', 'Depense']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 146, 146, 146),
                      width: 1,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.category_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showModal();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(),
                        width: 250,
                        child: _selectRubriques.nomRubrique == ""
                            ? Text("Choisir une Rubrique",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: grey.withOpacity(0.8),
                                ))
                            : Text(_selectRubriques.nomRubrique,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: black,
                                )),
                      ),
                    ),
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
                        controller: _description,
                        maxLines: null,
                        cursorColor: black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Ajouter une description",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: grey,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
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
                      keyboardType: TextInputType.phone,
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
                      onTap: () async {
                        if (_edit) {
                          await _savePrevision();
                        } else {
                          await editData();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                            color: !_edit ? Colors.green : Colors.orange,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Color.fromARGB(255, 146, 146, 146),
                              width: 1,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              _edit ? Icons.edit_outlined : Icons.save,
                              color: white,
                            ),
                            Text(
                              _edit ? "Modifier" : "Enregistrer",
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

  _showSelectedMonthModal() {
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
              itemCount: getAllRubriques().length,
              itemBuilder: (context, index) {
                var rubriques = getAllRubriques();
                GFRubriques month = rubriques[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectRubriques = month;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: _selectRubriques.nomRubrique == month.nomRubrique
                            ? blue
                            : white,
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      month.nomRubrique,
                      style: TextStyle(fontSize: 18, color: black),
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

  _savePrevision() async {
    var prevision = getPrevisionKey(widget.month, widget.year);
    if (prevision != -1) {
      await _saveData(prevision);
    } else {
      await _saveData(-1);
    }
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

  _saveData(int index) async {
    if (index == -1) {
      var prevision =
          await previsionsBox.add(HPrevisions(widget.month!, widget.year!));
      await lignesPrevisionsBox.add(HLignesPrevisions(
        _selectedType,
        double.parse(_amount.text),
        prevision,
        _description.text,
        _selectRubriques.uid,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    } else {
      await lignesPrevisionsBox.add(HLignesPrevisions(
        _selectedType,
        double.parse(_amount.text),
        index,
        _description.text,
        _selectRubriques.uid,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    }
  }

  editData() async {
    await lignesPrevisionsBox.putAt(
        widget.ligneP!.uid!,
        HLignesPrevisions(
          _selectedType,
          double.parse(_amount.text),
          widget.ligneP!.prevision!,
          _description.text,
          _selectRubriques.uid,
        ));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  indexPage: 1,
                )),
        (route) => false);
  }
}
