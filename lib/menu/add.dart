import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AddPage extends StatefulWidget{

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Terrain");

  sendField() {
    database.push().set({
      'id' : 1,
      'nom' : 'Test',
      'description' : 'Blabla',
      'adresse' : '4 allée des fleurs',
      'cp' : 35000,
      'ville' : 'Rennes',
      'etat' : 3,
      'latitude' : 48.0359541,
      'longitude' : -1.8419968
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FlatButton(
            onPressed: () => sendField(),
            child: Text(
              "Ajouter Terrain",
            ),
            textColor: Colors.white,
            color: Colors.black,
          )
        )
    );
  }

}