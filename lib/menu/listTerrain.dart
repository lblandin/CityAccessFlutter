import 'package:CityAccess/Other/FadeAnimation.dart';
import 'package:CityAccess/menu/detailTerrain.dart';
import 'package:CityAccess/model/terrain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTerrainPage extends StatefulWidget {
  ListTerrainPage({this.app});

  final FirebaseApp app;

  @override
  _ListTerrainPageState createState() => _ListTerrainPageState();
}

class _ListTerrainPageState extends State<ListTerrainPage> {
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
            data[key]["img"],
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
        backgroundColor: Colors.white,
        body: terrains.length == 0
            ? Center(
                child: Text("Loading..."),
              )
            : CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.green,
                  actions: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(width: 10,)
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Liste des terrains",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    background: Image.asset(
                      "assets/stade.jpg",
                      color: Colors.black54,
                      colorBlendMode: BlendMode.darken,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        child: Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      terrains[index].nom,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(terrains[index].adresse),
                                    Text(terrains[index].ville),
                                    terrains[index].etat == 1
                                        ? Text("Mauvais")
                                        : Text("Bon"),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              new MaterialPageRoute(builder: (context) => DetailTerrainPage(id: index)));
                        },
                      ),
                    ),
                    childCount : terrains.length,
                  ),
                )
              ]));
  }
}
