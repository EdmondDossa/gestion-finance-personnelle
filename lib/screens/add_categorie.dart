import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_finance/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategorie extends StatefulWidget {
  const AddCategorie({super.key});

  @override
  State<AddCategorie> createState() => _AddCategorieState();
}

class _AddCategorieState extends State<AddCategorie> {
  TextEditingController? _categorieName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(color: grey.withOpacity(0.03)),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Créer une catégorie",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: buttonColor,
                  ),
                  child: Icon(
                    Icons.money_off,
                    size: 25,
                    color: grey,
                  ),
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: grey,
                ))),
                child: TextField(
                  controller: _categorieName,
                  cursorColor: black,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nom de la Catégorie",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: grey,
            ))),
            child: TextField(
              controller: _categorieName,
              cursorColor: black,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Descripion de la Catégorie",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: red,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: green.withOpacity(0.7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.save,
                        color: white,
                      ),
                      Text(
                        "Enrégistrer",
                        style: TextStyle(
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
