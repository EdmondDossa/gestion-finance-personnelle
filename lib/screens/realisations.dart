import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_finance/Hive_Models/allModels.dart';
import 'package:gestion_finance/Hive_Models/box.dart';
import 'package:gestion_finance/models/lignes_previsions.dart';
import 'package:gestion_finance/models/previsions.dart';
import 'package:gestion_finance/models/rubriques.dart';
import 'package:gestion_finance/models/realisations.dart';
import 'package:gestion_finance/screens/all_rubriques.dart';
import 'package:gestion_finance/screens/home.dart';
import 'package:gestion_finance/screens/transactions.dart';
import 'package:gestion_finance/utilities/auth_services.dart';
import 'package:gestion_finance/utilities/fonctions.dart';
import 'package:intl/intl.dart';
import 'package:gestion_finance/utilities/colors.dart';

class CreateRealisationPage extends StatefulWidget {
  const CreateRealisationPage(
      {super.key,
      required this.month,
      required this.year,
      this.selectRealisation});

  final String? month;
  final String? year;
  final GFRealisation? selectRealisation;
  @override
  State<CreateRealisationPage> createState() => _CreateRealisationPageState();
}

class _CreateRealisationPageState extends State<CreateRealisationPage> {
  TextEditingController _nameEspense = TextEditingController();
  TextEditingController _description = TextEditingController(text: "");
  TextEditingController _amount = TextEditingController();
  GFRubriques _selectRubriques =
      GFRubriques("", "", authServices.currentUser.uid);
  GFRubriques _selectSource = GFRubriques("", "", authServices.currentUser.uid);
  String _selectedType = "Recette";
  bool _edit = false;
  DateTime _date = DateTime.now();
  int? _prevision;
  List<GFRubriques?> _recetteRubriques = [];
  @override
  void initState() {
    super.initState();
    _prevision = getPrevisionKey(widget.month, widget.year);
    _recetteRubriques = getAllRubriquesRecettes(_prevision!);
    if (widget.selectRealisation != null) {
      _edit = true;
      _selectRubriques = getRubrique(widget.selectRealisation!.rubriquesUid!);
      if (widget.selectRealisation!.source != null) {
        _selectSource = getRubrique(widget.selectRealisation!.source!);
      }
      _description.text = widget.selectRealisation!.description!;
      _amount.text = widget.selectRealisation!.montant!.toString();
    }
  }

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
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.red,
                          width: 1,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.outbond_sharp,
                          color: white,
                        ),
                        Text(
                          "Realisation",
                          style: TextStyle(color: white),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_edit) {
                      _deletePopup();
                      print(widget.selectRealisation!.uid!);
                    }
                  },
                  child: Container(
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
                  !_edit
                      ? "Enrégistrer votre opération"
                      : "Modifier la réalisation",
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
            if (_selectedType == "Depense")
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
                          _showSourceModal();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(),
                          width: 250,
                          child: _selectSource.nomRubrique == ""
                              ? Text("Choisir la source de cette dépense",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: grey.withOpacity(0.8),
                                  ))
                              : Text(_selectSource.nomRubrique,
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
            GestureDetector(
              onTap: () => _selectDate(context),
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
                        Icon(Icons.calendar_month_outlined),
                        Text(
                          !_edit ? "Enrégistrer le" : "Modifier le",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat.yMMMMd("fr_FR").format(_date),
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
                        if (_amount.text.isEmpty) {
                          SnackBar snackBar1 = const SnackBar(
                            content: Text("Le montant n'a pas été renseigner!"),
                            backgroundColor: red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                          return;
                        }

                        if (_selectRubriques.nomRubrique.isEmpty) {
                          SnackBar snackBar1 = const SnackBar(
                            content: Text(
                                "Vous n'avez pas sélectionner de rubrique!"),
                            backgroundColor: red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                          return;
                        }

                        if (_selectedType == "Depense") {
                          if (_selectSource.nomRubrique.isEmpty) {
                            SnackBar snackBar1 = const SnackBar(
                              content: Text(
                                  "Vous n'avez pas renseigner la source de la dépense!"),
                              backgroundColor: red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar1);
                            return;
                          }
                        }

                        if (_description.text.isEmpty) {
                          SnackBar snackBar1 = const SnackBar(
                            content: Text("Le champ description est vide!"),
                            backgroundColor: red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                          return;
                        }
                        if (!_edit) {
                          await _saveRealisation();
                          SnackBar snackBar1 = SnackBar(
                            content: Text(
                                "Votre ${_selectedType} a été enregistrée avec succès!"),
                            backgroundColor: green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                        } else {
                          _editRealisation();
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
                              !_edit ? Icons.save : Icons.edit,
                              color: white,
                            ),
                            Text(
                              !_edit ? "Enregistrer" : "Modifier",
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

  _showSelectedRubriqueModal() {
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

  _showSelectedSourceModal() {
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
              itemCount: _recetteRubriques.length,
              itemBuilder: (context, index) {
                var month = _recetteRubriques[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectSource = month;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: _selectSource.nomRubrique == month?.nomRubrique
                            ? blue
                            : white,
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      month!.nomRubrique,
                      style: TextStyle(fontSize: 18, color: black),
                    ),
                  ),
                );
              },
            ),
          ),
          //SizedBox(width: 20,),
          /* GestureDetector(
            onTap: () {
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllRubriques()));
            },
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
                              "Ajouter Rubrique",
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
          ) */
        ],
      ),
    );
  }

  _saveRealisation() async {
    if (_selectSource.nomRubrique == "") {
      await realisationsBox.add(HRealisations(
          type: _selectedType,
          date: _date,
          montant: double.parse(_amount.text),
          rubrique: _selectRubriques.uid!,
          description: _description.text));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    } else {
      await realisationsBox.add(HRealisations(
          type: _selectedType,
          date: _date,
          montant: double.parse(_amount.text),
          rubrique: _selectRubriques.uid!,
          source: _selectSource.uid,
          description: _description.text));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    }
  }

  _editRealisation() async {
    if (_selectSource.nomRubrique == "") {
      await realisationsBox.put(
          widget.selectRealisation!.uid!,
          HRealisations(
              type: _selectedType,
              date: _date,
              montant: double.parse(_amount.text),
              rubrique: _selectRubriques.uid!,
              description: _description.text));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    } else {
      await realisationsBox.put(
          widget.selectRealisation!.uid!,
          HRealisations(
              type: _selectedType,
              date: _date,
              montant: double.parse(_amount.text),
              rubrique: _selectRubriques.uid!,
              source: _selectSource.uid,
              description: _description.text));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    indexPage: 1,
                  )),
          (route) => false);
    }
  }

  _showModal() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (_) {
        return _showSelectedRubriqueModal();
      },
    );
  }

  _showSourceModal() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (_) {
        return _showSelectedSourceModal();
      },
    );
  }

  _deletePopup() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Supression',
              textAlign: TextAlign.center,
            ),
            content:
                Text('Êtes-vous sûr de vouloir supprimer cette réalisation ?'),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:25,vertical:10),
                  decoration:BoxDecoration(
                    color: blue.withOpacity(0.7),
                    borderRadius:BorderRadius.circular(5)
                  ),
                  child:Text(
                    'Annuler',
                    style: TextStyle(fontWeight: FontWeight.w400, color:white),
                  ),
                )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Supprimer',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, color: white)),
                onPressed: () async {
                  // Action à effectuer lorsque l'utilisateur appuie sur "Valider"
                  await realisationsBox
                      .delete(widget.selectRealisation!.uid!);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                indexPage: 1,
                              )),
                      (route) => false);
                },
              ),
            ],
          );
        });
  }
}
