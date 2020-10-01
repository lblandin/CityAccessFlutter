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
  final refDatabase = FirebaseDatabase.instance;

  final terrainName = 'nom';
  DatabaseReference _terrainRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _terrainRef = database.reference().child("Terrain");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: _terrainRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.value['nom'],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              snapshot.value['adresse'],

                            ),
                            Text(
                              snapshot.value['ville'],
                            ),
                            snapshot.value['etat'] == 1
                                ? Text("Mauvais")
                                : Text("Bon"),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _terrainRef.child(snapshot.key).remove(),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
