import 'package:flutter/material.dart';

class Expense {
  final DateTime date;
  final double amount;

  Expense({required this.date, required this.amount});
}

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;
  late double _amount;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _amount = 0.0;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Ajoutez ici votre code pour enregistrer la dépense dans la base de données ou effectuer d'autres opérations nécessaires
      Expense expense = Expense(
        date: _selectedDate,
        amount: _amount,
      );
      print('Dépense enregistrée : $expense');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Ajouter une dépense'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Ajoutez ici la logique pour supprimer la dépense
              print('Supprimer la dépense');
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ajoutez ici la logique pour revenir à l'écran précédent
              print('Revenir en arrière');
            },
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Ajoutez ici la logique pour télécharger la dépense
              print('Télécharger la dépense');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Date'),
                subtitle: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un montant';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Veuillez saisir un montant valide';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
                decoration: InputDecoration(
                  labelText: 'Montant',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveExpense,
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
