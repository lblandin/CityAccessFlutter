import 'dart:math';

import 'package:CityAccess/model/terrain.dart';
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

  List<Terrain> terrains = [];

  @override
  initState(){

    DatabaseReference reference = FirebaseDatabase.instance.reference();
    reference.child('Terrain').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      terrains.clear();
      for (var key in keys) {
        Terrain terrain = new Terrain(
            data[key]["id"],
            data[key]["nom"],
            data[key]["description"],
            data[key]["adresse"],
            data[key]["cp"],
            data[key]["ville"],
            data[key]["etat"],
            data[key]["latitude"],
            data[key]["longitude"]);
        terrains.add(terrain);

      }
      setState(() {
        print('lenght terrains: ${terrains.length}');
      });
    });

    super.initState();
  }

  double lat = Random.secure().nextDouble() * (49 - 47) + 47;
  double lng = Random.secure().nextDouble() * (-0.5 - (-1.5)) + 1.5;

  int index;

  sendField() {
    setState(() {
      index = terrains.length+1;
    });
    database.push().set({
      'id' : index,
      'nom' : 'Test'+lat.toString(),
      'description' : 'Blabla',
      'adresse' : '4 allée des fleurs',
      'cp' : 35000,
      'ville' : 'Rennes',
      'etat' : 3,
      'latitude' : lat,
      'longitude' : lng,
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