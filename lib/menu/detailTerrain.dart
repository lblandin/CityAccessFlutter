import 'package:CityAccess/Other/FadeAnimation.dart';
import 'package:CityAccess/menu/listTerrain.dart';
import 'package:CityAccess/model/terrain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTerrainPage extends StatefulWidget {
  DetailTerrainPage({this.app, this.id});

  final FirebaseApp app;
  int id;

  @override
  _DetailTerrainPage createState() => _DetailTerrainPage();
}

class _DetailTerrainPage extends State<DetailTerrainPage> {
  List<Terrain> terrains = [];

  @override
  void initState() {
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
        print('lenght : ${terrains.length}');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                    tag: "assets/stade.jpg",
                    child: ClipRRect(
                      //borderRadius: BorderRadius.circular(30.0),
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.darken),
                        child: Image(
                          image: AssetImage("assets/stade.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      terrains[widget.id].nom,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          terrains[widget.id].ville,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            terrains[widget.id].adresse,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Container(
                          child: Text(
                            terrains[widget.id].cp.toString() +
                                " " +
                                terrains[widget.id].ville,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  terrains[widget.id].etat == 1
                      ? Text("État : Bon", style: TextStyle(fontSize: 18),)
                      : Text("État : Mauvais", style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20),
                  Text(
                    terrains[widget.id].desc,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
