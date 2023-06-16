import 'package:flutter/material.dart';

class Transaction {
  Icon icon;
  String title;
  String description;
  double amount;
  Color amountColor;
  Transaction({required this.icon,required this.title,required this.amount,required this.description, required this.amountColor});
}
